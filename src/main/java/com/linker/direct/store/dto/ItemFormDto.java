package com.linker.direct.store.dto;

import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.entity.Item;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Getter
public class ItemFormDto { // 상품 등록 Dto
    private String id;
    private String itemName;
    private Integer price;
    private String description;
    private Integer stockQuantity;
    private ItemSellStatus itemSellStatus;
    private String categoryId;
    private List<ItemImgDto> itemImgDtoList = new ArrayList<>();
    private List<String> itemImgIds = new ArrayList<>();

    public Item createItem(){ // Item
        Item item = new Item();
        id = item.getId();
        itemName = item.getName();
        price = item.getPrice();
        description = item.getDescription();
        stockQuantity = item.getStockQuantity();
        itemSellStatus = item.getItemSellStatus();
        categoryId = item.getCategoryId();
        return item;
    }

//    public Item createItem(){ // 상품등록 로직
//        return modelMapper(this, Item);
//    }
//    public static ItemFormDto of(Item item){ // ??????
//        return modelMapper.map(item, ItemFormDto);
//    }
}
