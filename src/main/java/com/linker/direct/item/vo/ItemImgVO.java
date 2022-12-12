package com.linker.direct.item.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

// DB - item_img
@Getter @Setter @ToString
public class ItemImgVO { // 상품 이미지 정보
    private Long item_img_id; // 상품 이미지 ID
    private Long item_id; // 상품 연결
    private String img_name; // 상품 이미지 이름 - uuid.ext
    private String origin_name; // 원본 이미지 이름 - origin.ext

    private Timestamp created_at; // 생성일

    public void updateItemImg(Long item_id, String img_name, String origin_name) {
        this.item_id = item_id;
        this.img_name = img_name;
        this.origin_name = origin_name;
    }
}
