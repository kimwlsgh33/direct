package com.linker.direct.item.dto;

import com.linker.direct.item.ItemSellStatus;
import com.linker.direct.item.vo.ItemVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter @ToString
public class ItemFormDto {
    private Long item_id;
    private Long user_id;
    private Long category_id;
    private String name;
    private int price;
    private int stock;
    private String description;
    private ItemSellStatus status;
    private List<ItemImgDto> itemImgDtoList = new ArrayList<>(); // output

    // Item -> ItemFormDto
    public static ItemFormDto of(ItemVO itemVO) {
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setItem_id(itemVO.getItem_id());
        itemFormDto.setUser_id(itemVO.getUser_id());
        itemFormDto.setName(itemVO.getName());
        itemFormDto.setPrice(itemVO.getPrice());
        itemFormDto.setStock(itemVO.getStock());
        itemFormDto.setDescription(itemVO.getDescription());
        itemFormDto.setCategory_id(itemVO.getCategory_id());
        itemFormDto.setStatus(itemVO.getStatus());
        return itemFormDto;
    }

    // ItemFormDto -> Item
    public static ItemVO toVO(ItemFormDto itemFormDto) {
        ItemVO itemVO = new ItemVO();
        itemVO.setItem_id(itemFormDto.getItem_id());
        itemVO.setUser_id(itemFormDto.getUser_id());
        itemVO.setName(itemFormDto.getName());
        itemVO.setPrice(itemFormDto.getPrice());
        itemVO.setStock(itemFormDto.getStock());
        itemVO.setDescription(itemFormDto.getDescription());
        itemVO.setCategory_id(itemFormDto.getCategory_id());
        itemVO.setStatus(itemFormDto.getStatus());
        return itemVO;
    }
}
