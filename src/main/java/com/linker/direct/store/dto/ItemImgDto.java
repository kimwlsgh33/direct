package com.linker.direct.store.dto;

import com.linker.direct.store.entity.ItemImg;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemImgDto {
    private String id;
    private String ImgName;
    private String originName;
    private String ImgUrl;
    private String thumbnail;

    public static ItemImgDto of(ItemImg itemImg) {
//        return modelMapper.map(itemImg, ItemImgDto);
        ItemImgDto itemImgDto = new ItemImgDto();
        itemImgDto.setId(itemImg.getId());
        itemImgDto.setImgName(itemImg.getImgName());
        itemImgDto.setOriginName(itemImg.getOriginName());
        itemImgDto.setImgUrl(itemImg.getImgUrl());
        itemImgDto.setThumbnail(itemImg.getThumbnail());
        return itemImgDto;
    }
}
