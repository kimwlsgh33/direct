package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
public class ItemImgDTO {
    private MultipartFile uploadFile;
    private ItemVO itemVO;

    public static ItemImgDTO of(MultipartFile uploadFile, ItemVO itemVO) {
        ItemImgDTO itemImgDto = new ItemImgDTO();
        itemImgDto.uploadFile = uploadFile;
        itemImgDto.itemVO = itemVO;
        return itemImgDto;
    }
}
