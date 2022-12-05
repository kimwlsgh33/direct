package com.linker.direct.cart.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component
@Data
public class CartDTO {
    private int cart_id;
    private Date cart_date;  // 카트 담은 시간.
    private String product_name;
    private String product_price;
    private String product_img;
    private int product_count;
}
