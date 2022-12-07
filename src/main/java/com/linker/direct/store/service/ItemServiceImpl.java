package com.linker.direct.store.service;

import com.linker.direct.store.constant.ItemSellStatus;
// dao
import com.linker.direct.store.dao.ItemDao;
import com.linker.direct.store.dao.ItemImgDao;
// dto
import com.linker.direct.store.dto.ItemFormDto;
import com.linker.direct.store.dto.ItemImgDto;
// entity
import com.linker.direct.store.vo.Item;
import com.linker.direct.store.vo.ItemImg;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {
    private final ItemImgService itemImgService;
    private final ItemDao itemDao;
    private final ItemImgDao itemImgDao;


    @Override
    public void create(ItemFormDto itemFormDto, List<MultipartFile> uploadFiles) throws Exception {
        itemFormDto.setStatus(ItemSellStatus.SELLING); // 판매 상태 : 판매중
        //====================================================================================================
        // 상품 등록 ====================================================================================================
        //====================================================================================================
        log.info("상품 등록 : " + itemFormDto.toString());
        Item item = itemFormDto.toEntity(itemFormDto);
        itemDao.create(item);
        
        //==================================================================================================
        // itemImg 저장 ==================================================================================================
        //==================================================================================================
        for(MultipartFile uploadFile : uploadFiles) {
            ItemImgDto itemImgDto = ItemImgDto.of(uploadFile, item);
            itemImgService.upload(itemImgDto); // 사진업로드, item_img 테이블 저장
        }
    }

    @Override
    public Item read(int id) {
        Item item = itemDao.read(id);
        List<ItemImg> itemImgs = itemImgDao.readItemImgs(id);

//        ItemFormDto itemFormDto = ItemFormDto.of(item, itemImgs);
        return item;
    }
}
