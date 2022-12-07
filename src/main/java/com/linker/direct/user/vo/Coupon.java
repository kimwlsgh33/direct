package com.linker.direct.user.vo;

import com.linker.direct.common.Base;
import com.linker.direct.user.constant.CouponStatus;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter @ToString
@EqualsAndHashCode
public class Coupon extends Base {
    private Long coupon_id;
    private String name;
    private String description;
    private int discount_price;
    private int discount_rate;
    private int min_price;
    private Timestamp expire_date;
    private CouponStatus status;
    private Long user_id;

    public Coupon(Long coupon_id, int discount_price, int discount_rate, int min_price, String name, String description, String start_date, Timestamp expire_date, Long user_id) {
        this.coupon_id = coupon_id;
        this.name = name;
        this.description = description;
        this.discount_price = discount_price;
        this.discount_rate = discount_rate;
        this.min_price = min_price;
        this.expire_date = expire_date;
        this.status = CouponStatus.USABLE;
        this.user_id = user_id;
    }
}
