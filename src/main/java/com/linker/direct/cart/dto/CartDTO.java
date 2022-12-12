package com.linker.direct.cart.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;

@Component
@Data
public class CartDTO {
    private Timestamp created_at;  // 카트 담은 시간.
    private int count; // 담을 수량
    private long item_id;
    private long user_id;
//    --------------------------------- 쿼리문으로 만든 column, mysql테이블에는 없음
    private String product_name;
    private String product_price;
    private String product_image;
    private int item_count;
}
