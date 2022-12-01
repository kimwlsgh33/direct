package com.linker.direct.store.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// DB - item_img
@Getter @Setter @ToString
public class ItemImg extends Base { // 상품 이미지 정보
    private int id; // 상품 이미지 ID
    private String imgName; // 상품 이미지 이름 - uuid.ext
    private String originName; // 원본 이미지 이름 - origin.ext
    //private String imgUrl; // 이미지 조회 경로 - /item/{id}/img/{imgName}

    private int item_id; // 상품 연결 - join column

    public void updateItemImg(String imgName, String originName, Item item) {
        this.imgName = imgName;
        this.originName = originName;
        this.item_id = item.getId();
    }
}
