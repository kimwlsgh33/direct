package com.linker.direct.store.entity;

import lombok.Getter;

// DB - item_img
@Getter
public class ItemImg extends Base { // 상품 이미지 정보
    private String id; // 상품 이미지 ID
    private String imgName; // 상품 이미지 이름
    private String originName; // 원본 이미지 이름
    private String imgUrl; // 이미지 조회 경로
    private String thumbnail; // 썸네일 유무 / 썸네일 이미지 경로

    private Item item; // 상품 연결 - join column

    public void updateItemImg(String imgName, String originName, String imgUrl) {
        this.imgName = imgName;
        this.originName = originName;
        this.imgUrl = imgUrl;
    }
}
