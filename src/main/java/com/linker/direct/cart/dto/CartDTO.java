package com.linker.direct.cart.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class CartDTO {
    private int product_num;
    private String product_name;
    private String product_price;
    private String product_image;
    private int product_count;
}
