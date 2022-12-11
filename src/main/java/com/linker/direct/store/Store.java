package com.linker.direct.store;

import com.linker.direct.user.constant.CommonStatus;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

// VO 기본 형식
@Getter @Setter @ToString
@EqualsAndHashCode
public class Store {
    private Long store_id;
    private Long user_id;
    private String name;
    private String address;
    private String store_img_url;
    private String phone;
    private String introduce;
    private BigDecimal rating;
    private int favorite_count;
    private int review_count;
    private String business_hour;
    private String holiday;
    private CommonStatus status;
    private Long category_id;
}