package com.linker.direct.store.dto;

public class MainItemDto {
    private String id;
    private String itemName;
    private String itemDetail;
    private String imgUrl;
    private Integer price;

    public MainItemDto(String id, String itemName, String itemDetail, String imgUrl, Integer price) {
        this.id = id;
        this.itemName = itemName;
        this.itemDetail = itemDetail;
        this.imgUrl = imgUrl;
        this.price = price;
    }
}
