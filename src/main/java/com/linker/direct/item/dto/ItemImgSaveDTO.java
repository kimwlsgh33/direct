package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
public class ItemImgSaveDTO {
    // 저장용
    private MultipartFile uploadFile;
    private ItemVO itemVO;


    public static ItemImgSaveDTO of(MultipartFile uploadFile, ItemVO itemVO) {
        ItemImgSaveDTO itemImgSaveDto = new ItemImgSaveDTO();
        itemImgSaveDto.uploadFile = uploadFile;
        itemImgSaveDto.itemVO = itemVO;
        return itemImgSaveDto;
    }
}
