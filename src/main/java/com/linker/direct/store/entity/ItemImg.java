package com.linker.direct.store.entity;

import lombok.Getter;
import lombok.Setter;

// DB - item_img
@Getter @Setter
public class ItemImg extends Base { // 상품 이미지 정보
    private String id; // 상품 이미지 ID
    private String imgName; // 상품 이미지 이름 - uuid.ext
    private String originFileName; // 원본 이미지 이름 - origin.ext
    //private String imgUrl; // 이미지 조회 경로 - /item/{id}/img/{imgName}

    private Integer item_id; // 상품 연결 - join column

    public void updateItemImg(String imgName, String originFileName, Item item) {
        this.imgName = imgName;
        this.originFileName = originFileName;
        this.item_id = item.getId();
    }
}
