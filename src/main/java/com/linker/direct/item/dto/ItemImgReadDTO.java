package com.linker.direct.item.dto;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemImgReadDTO {
    private String img_url;
    private String img_name;

    public static ItemImgReadDTO of(String img_name, String img_url) {
        ItemImgReadDTO itemImgReadDto = new ItemImgReadDTO();
        itemImgReadDto.img_url = img_url;
        itemImgReadDto.img_name = img_name;
        return itemImgReadDto;
    }
}
