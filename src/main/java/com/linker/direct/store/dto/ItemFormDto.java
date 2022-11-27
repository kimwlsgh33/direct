package com.linker.direct.store.dto;

import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.entity.Item;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter
public class ItemFormDto { // 상품 등록 Dto
    private Integer id;
    private String itemName; // 상품이름
    private Integer price; // 상품가격
    private String description; // 상품설명
    private Integer stockQuantity; // 상품재고
    private ItemSellStatus itemSellStatus; // 판매 상태
    private Integer categoryId; // 상품 카테고리 ID
    private List<ItemImgDto> itemImgDtoList = new ArrayList<>(); // 상품 이미지 리스트
    private List<String> itemImgIds = new ArrayList<>(); // 상품 이미지 ID 리스트

    public Item createItem(){ // 새로운 Item 객체 생성하는 메소드
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

    public static ItemFormDto of(Item item){
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setId(item.getId());
        itemFormDto.setItemName(item.getName());
        itemFormDto.setPrice(item.getPrice());
        itemFormDto.setDescription(item.getDescription());
        itemFormDto.setStockQuantity(item.getStockQuantity());
        itemFormDto.setItemSellStatus(item.getItemSellStatus());
        return itemFormDto;
    }

//    public static ItemFormDto of(Item item){ // ??????
//        return modelMapper.map(item, ItemFormDto);
//    }
}
