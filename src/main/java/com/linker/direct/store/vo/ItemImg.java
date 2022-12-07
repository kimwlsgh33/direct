package com.linker.direct.store.vo;

import com.linker.direct.common.Base;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// DB - item_img
@Getter @Setter @ToString
public class ItemImg extends Base { // 상품 이미지 정보
    private Long item_img_id; // 상품 이미지 ID
    private String img_name; // 상품 이미지 이름 - uuid.ext
    private String origin_name; // 원본 이미지 이름 - origin.ext
    //private String imgUrl; // 이미지 조회 경로 - /item/{id}/img/{imgName}

    private Long item_id; // 상품 연결

    public void updateItemImg(String img_name, String origin_name, Long item_id) {
        this.img_name = img_name;
        this.origin_name = origin_name;
        this.item_id = item_id;
    }
}
