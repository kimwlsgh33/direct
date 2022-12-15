package com.linker.direct.coupon.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component("CouponDTO")
@Data
public class CouponDTO {
	
	private Long coupon_id;
	private String name;
	private int discount_price;
	private int discount_rate;
	private int min_price;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Timestamp created_at;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Timestamp updated_at;
	private Timestamp expired_date;
	private String status;

}
