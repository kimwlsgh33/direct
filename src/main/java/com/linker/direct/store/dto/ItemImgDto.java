package com.linker.direct.store.dto;

import com.linker.direct.store.entity.Item;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter @Setter
public class ItemImgDto {
    private MultipartFile uploadFile;
    private Item item;
    private String uuidFilename;

    public static ItemImgDto of(MultipartFile uploadFile, Item item) {
        ItemImgDto itemImgDto = new ItemImgDto();
        itemImgDto.uploadFile = uploadFile;
        itemImgDto.item = item;
        return itemImgDto;
    }
}
