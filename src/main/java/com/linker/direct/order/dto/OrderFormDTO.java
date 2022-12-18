package com.linker.direct.order.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderFormDTO {
    private Long item_id; // 상품 id
    private String name; // 상품 이름

    private String description; // 상품 설명
    private String img_url; // 상품 이미지
    private int item_price; // 상품 가격
    private int count; // 주문 수량

    // 사용하지 않는 변수
    private Long option_id; // 옵션 id
}
