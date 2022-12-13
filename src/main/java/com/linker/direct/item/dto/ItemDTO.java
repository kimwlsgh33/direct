package com.linker.direct.item.dto;

import com.linker.direct.category.CategoryVO;
import com.linker.direct.item.vo.ItemImgVO;
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

    // 아이템 & 이미지
    public static ItemDTO of(ItemVO itemVO, CategoryVO categoryVO, List<ItemImgReadDTO> imgList) {
        ItemDTO itemDTO = new ItemDTO();
        itemDTO.setItemVO(itemVO);
        itemDTO.setCategoryVO(categoryVO);
        itemDTO.setImgList(imgList);
        return itemDTO;
    }
}
