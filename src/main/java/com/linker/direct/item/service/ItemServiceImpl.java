package com.linker.direct.item.service;

// vo
import com.linker.direct.category.CategoryService;
import com.linker.direct.category.CategoryVO;
import com.linker.direct.item.dto.ItemImgReadDTO;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.common.util.SearchCriteria;
// dto
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.dto.ItemImgSaveDTO;
import com.linker.direct.item.dto.ItemRecommDTO;
// dao
import com.linker.direct.item.dao.ItemDAO;
// lib
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.linker.direct.item.ItemSellStatus;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {
    private final ItemImgService itemImgService;
    private final CategoryService categoryService;
    private final ItemDAO itemDao;
    private final ItemOptionService itemOptionService;

    //==================================================================================================
    // 상품 등록
    //==================================================================================================
    @Override
    public void create(ItemFormDTO itemFormDto, List<MultipartFile> uploadFiles, /*추가*/ItemOptionVO itemOptionVO) throws Exception {
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
        
        //==================================================================================================
        // itemOption 저장 ==================================================================================================
        //==================================================================================================
        
        itemOptionVO.setItem_id(itemVO.getItem_id());
        itemOptionVO.setOptionName(itemOptionVO.getOptionName());
        itemOptionVO.setOptionPrice(itemOptionVO.getOptionPrice());
        itemOptionVO.setOptionDescription(itemOptionVO.getOptionDescription());
        log.info("상품 옵션 등록 : " + itemOptionVO);
        itemOptionService.create(itemOptionVO); // itemOption 테이블 저장
        
    }

    //==================================================================================================
    // 상품 읽기 (읽어서, DTO에 저장)
    //==================================================================================================
    @Override
    public ItemDTO read(ItemVO itemVO) throws Exception {
        // 상품 가져옴
        ItemVO resultItem = itemDao.read(itemVO);

        // 상품 카테고리 가져옴
        String categoryName = categoryService.readByItem(resultItem);

        // 상품 이미지 가져옴
        List<ItemImgReadDTO> itemImgs = itemImgService.readByItem(resultItem);
        
        // 추가 아이템 옵션 정보 가져옴
        //ItemOptionVO itemOptionVO = itemOptionService.readByItem(resultItem);

        // 상품, 카테고리, 상품 이미지 DTO에 저장
        ItemDTO itemDTO = new ItemDTO();
        itemDTO.setItemVO(resultItem);
        itemDTO.setCategoryName(categoryName);
        itemDTO.setImgList(itemImgs);
        //추가
        //itemDTO.setItemOptionVO(itemOptionVO);
        return itemDTO;
    }

    //==================================================================================================
    // 상품 검색 목록 조회 (페이징)
    //==================================================================================================
    @Override
    public List<ItemDTO> searchListPaging(SearchCriteria cri) throws Exception {
        List<ItemVO> searchListPaging = itemDao.searchListPaging(cri);

        // 상품 정보 & 상품 이미지
        List<ItemDTO> itemDTOList = new ArrayList<>();
        for(ItemVO itemVO : searchListPaging) {
            // 상품 이미지 가져옴
            List<ItemImgReadDTO> itemImgs = itemImgService.readByItem(itemVO);
            // 상품, 상품 이미지 DTO에 저장
            ItemDTO itemDTO = new ItemDTO();
            itemDTO.setItemVO(itemVO);
            itemDTO.setImgList(itemImgs);
            // 리스트에 추가
            itemDTOList.add(itemDTO);
        }

        return itemDTOList;
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
    
    //==================================================================================================
    // 추천 상품 목록
    //==================================================================================================
    @Override
    public List<ItemRecommDTO> recommendList() throws Exception {
        List<ItemRecommDTO> before = itemDao.recommendList();


        List<ItemRecommDTO> after = new ArrayList<>();
        for(ItemRecommDTO itemRecommDTO : before) {
            // 상품 이미지 가져옴
            String base64 = itemImgService.readImgFileUrl(itemRecommDTO.getImg_url());
            // 상품, 상품 이미지 DTO에 저장
            itemRecommDTO.setImg_url(base64);
            // 리스트에 추가
            after.add(itemRecommDTO);
        }

        return after;
    }
}
