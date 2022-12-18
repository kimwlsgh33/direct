package com.linker.direct.coupon.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp expired_date;
	private String status;

	// MAPPER때문에 만듬, 데이터테이블엔 해당컬럼 없다.
	private Long user_id;

}
