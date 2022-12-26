package com.linker.direct.item.dto;

import lombok.Data;

@Data
public class ItemRecommDTO {
    private Long item_id;
    private String name;
    private String price;

    private String img_url;
}
