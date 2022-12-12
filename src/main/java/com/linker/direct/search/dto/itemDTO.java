package com.linker.direct.search.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component("searchDTO")
@Data
public class itemDTO {
    private long item_id;
    private String name;
    private int price;
    private int stock;
    private String description;
    private Date created_at;
    private Date updated_at;
    private String status;
    private long category_id;
}

