package com.linker.direct.item.dto;

import com.linker.direct.category.CategoryVO;
import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.user.vo.UserVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString
public class ItemDTO {
    private ItemVO itemVO;
    private CategoryVO categoryVO;
    private List<ItemImgReadDTO> imgList;
    //추가
    private ItemOptionVO itemOptionVO;
}
