package com.linker.direct.search.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component("searchDTO")
@Data
public class SearchDTO {
    private int product_num;
    private String product_name;
    private String product_price;
    private String product_image;
    private String product_stock;
    private Date product_date;
    private String product_category;
    private String product_brand;
}

