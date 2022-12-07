package com.linker.direct.store.vo;

import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class ItemOption extends Base { // 상품 이미지 정보
    private Long item_option_id; // 상품 옵션 ID
    private Long item_id; // 상품 연결
    private String option; // 옵션 이름 - 색상, 사이즈
    private String content; // 옵션 내용 - 빨강, 파랑, 100, 200
    private int price;
    private String status;

    public ItemOption(Long item_option_id, Long item_id, String option, String content, int price) {
        this.item_option_id = item_option_id;
        this.item_id = item_id;
        this.option = option;
        this.content = content;
        this.price = price;
        this.status = "NORMAL";
    }
}
