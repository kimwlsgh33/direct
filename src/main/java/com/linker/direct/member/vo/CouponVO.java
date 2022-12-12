package com.linker.direct.member.vo;

import com.linker.direct.member.constant.CouponStatus;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CouponVO {
    private Long coupon_id;
    private String name;
    private String description;
    private int discount_price;
    private int discount_rate;
    private int min_price;
    private Timestamp expire_date;
    private CouponStatus status;
    private Long user_id;
}
