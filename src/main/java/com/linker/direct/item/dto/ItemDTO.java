package com.linker.direct.item.dto;

import com.linker.direct.item.vo.ItemVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString
public class ItemDTO {
    private ItemVO itemVO;
    private String categoryName;
    private List<ItemImgReadDTO> imgList;
    //추가
    // private ItemOptionVO itemOptionVO;
}
