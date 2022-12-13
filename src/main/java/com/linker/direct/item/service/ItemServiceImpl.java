package com.linker.direct.item.service;

// vo
import com.linker.direct.category.CategoryService;
import com.linker.direct.category.CategoryVO;
import com.linker.direct.item.dto.ItemImgReadDTO;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.common.util.SearchCriteria;
// dto
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.dto.ItemImgSaveDTO;
// dao
import com.linker.direct.item.dao.ItemDAO;
// lib
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.linker.direct.item.ItemSellStatus;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {
    private final ItemImgService itemImgService;
    private final CategoryService categoryService;
    private final ItemDAO itemDao;

    //==================================================================================================
    // 상품 등록
    //==================================================================================================
    @Override
    public void create(ItemFormDTO itemFormDto, List<MultipartFile> uploadFiles) throws Exception {
        itemFormDto.setStatus(ItemSellStatus.SELLING); // 판매 상태 : 판매중
        //====================================================================================================
        // 상품 등록 ====================================================================================================
        //====================================================================================================
        ItemVO itemVO = itemFormDto.toVO(itemFormDto);
        log.info("상품 등록 : " + itemVO.toString());
        itemDao.create(itemVO);
        log.info("상품 등록 완료" + itemVO.toString());
        
        //==================================================================================================
        // itemImg 저장 ==================================================================================================
        //==================================================================================================
        log.info("상품 이미지 등록 : " + uploadFiles.size());
        for(MultipartFile uploadFile : uploadFiles) {
            ItemImgSaveDTO itemImgSaveDto = ItemImgSaveDTO.of(uploadFile, itemVO);
            itemImgService.upload(itemImgSaveDto); // 사진업로드, item_img 테이블 저장
        }
    }

    //==================================================================================================
    // 상품 읽기 (읽어서, DTO에 저장)
    //==================================================================================================
    @Override
    public ItemDTO read(ItemVO itemVO) throws Exception {
        // 상품 가져옴
        ItemVO resultItem = itemDao.read(itemVO);

        // 상품 카테고리 가져옴
        CategoryVO categoryVO = categoryService.readByItem(resultItem);

        // 상품 이미지 가져옴
        List<ItemImgReadDTO> itemImgs = itemImgService.readByItem(resultItem);

        // 상품, 카테고리, 상품 이미지 DTO에 저장
        return ItemDTO.of(resultItem, categoryVO, itemImgs);
    }

    //==================================================================================================
    // 상품 검색 목록 조회 (페이징)
    //==================================================================================================
    @Override
    public List<ItemVO> searchListPaging(SearchCriteria cri) throws Exception {
        List<ItemVO> searchListPaging = itemDao.searchListPaging(cri);
        return searchListPaging;
    }

    //==================================================================================================
    // 상품 전체 개수
    //==================================================================================================
    @Override
    public int totalCount(SearchCriteria cri) throws Exception {
        return itemDao.totalCount(cri);
    }

    //==================================================================================================
    // 상품 검색 목록 조회
    //==================================================================================================
    @Override
    public List<ItemVO> searchListAll(SearchCriteria cri) throws Exception {
        return itemDao.searchListAll(cri);
    }
}
