package com.linker.direct.item.dto;

import com.linker.direct.item.ItemSellStatus;
import com.linker.direct.item.vo.Item;
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
    public static ItemFormDto of(Item item) {
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setItem_id(item.getItem_id());
        itemFormDto.setUser_id(item.getUser_id());
        itemFormDto.setName(item.getName());
        itemFormDto.setPrice(item.getPrice());
        itemFormDto.setStock(item.getStock());
        itemFormDto.setDescription(item.getDescription());
        itemFormDto.setCategory_id(item.getCategory_id());
        itemFormDto.setStatus(item.getStatus());
        return itemFormDto;
    }

    // ItemFormDto -> Item
    public static Item toVO(ItemFormDto itemFormDto) {
        Item item = new Item();
        item.setItem_id(itemFormDto.getItem_id());
        item.setUser_id(itemFormDto.getUser_id());
        item.setName(itemFormDto.getName());
        item.setPrice(itemFormDto.getPrice());
        item.setStock(itemFormDto.getStock());
        item.setDescription(itemFormDto.getDescription());
        item.setCategory_id(itemFormDto.getCategory_id());
        item.setStatus(itemFormDto.getStatus());
        return item;
    }
}
