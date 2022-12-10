package com.linker.direct.item.service;

// dao
// dto
// entity

import com.linker.direct.item.ItemSellStatus;
import com.linker.direct.item.dao.ItemDao;
import com.linker.direct.item.dao.ItemImgDao;
import com.linker.direct.item.dto.ItemFormDto;
import com.linker.direct.item.dto.ItemImgDto;
import com.linker.direct.item.vo.Item;
import com.linker.direct.item.vo.ItemImg;
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
