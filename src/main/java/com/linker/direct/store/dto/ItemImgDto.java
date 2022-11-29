package com.linker.direct.store.dto;

import com.linker.direct.store.entity.Item;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
public class ItemImgDto {
    private MultipartFile[] uploadFiles;
    private User user;
    private Item item;
    private String uuidFilename;


    public static ItemImgDto of(MultipartFile[] uploadFiles, User user) {
        ItemImgDto itemImgDto = new ItemImgDto();
        itemImgDto.uploadFiles = uploadFiles;
        itemImgDto.user = user;
        return itemImgDto;
    }
}
