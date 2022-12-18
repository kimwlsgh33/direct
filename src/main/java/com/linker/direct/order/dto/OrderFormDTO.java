package com.linker.direct.order.dto;

public class OrderFormDTO {
    private Long item_id; // 상품 id
    private String item_name; // 상품 이름
    private String item_image_url; // 상품 이미지
    private int item_price; // 상품 가격
    private int order_count; // 주문 수량

    // 사용하지 않는 변수
    private Long option_id; // 옵션 id
}
