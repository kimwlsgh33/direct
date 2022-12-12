package com.linker.direct.item.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ItemOptionVO { // 상품 이미지 정보
    private Long item_option_id; // 상품 옵션 ID
    private Long item_id; // 상품 연결
    private String option; // 옵션 이름 - 색상, 사이즈
    private String description; // 옵션 내용 - 빨강, 파랑, 100, 200
    private int price; // 옵션 가격
    private String status;
    private Timestamp created_at;
    private Timestamp updated_at;

    public ItemOptionVO() {
    }
}
