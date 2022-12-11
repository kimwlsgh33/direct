package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
public class ItemImgDto {
    private MultipartFile uploadFile;
    private ItemVO itemVO;

    public static ItemImgDto of(MultipartFile uploadFile, ItemVO itemVO) {
        ItemImgDto itemImgDto = new ItemImgDto();
        itemImgDto.uploadFile = uploadFile;
        itemImgDto.itemVO = itemVO;
        return itemImgDto;
    }
}
