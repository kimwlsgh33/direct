package com.linker.direct.store.dto;

import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.entity.Item;
import com.linker.direct.store.entity.ItemImg;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Getter @Setter @ToString
public class ItemFormDto {
    private int id;
    private String itemName;
    private int price;
    private int stock;
    private String description;
    private int category_id;
    private int createBy;
    private ItemSellStatus status;
    private List<ItemImgDto> itemImgDtoList = new ArrayList<>(); // output

    // Item -> ItemFormDto
    public static ItemFormDto of(Item item) {
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setId(item.getId());
        itemFormDto.setItemName(item.getName());
        itemFormDto.setPrice(item.getPrice());
        itemFormDto.setStock(item.getStock());
        itemFormDto.setDescription(item.getDescription());
        itemFormDto.setCategory_id(item.getCategory_id());
        itemFormDto.setStatus(item.getStatus());
        return itemFormDto;
    }

    // ItemFormDto -> Item
    public static Item toEntity(ItemFormDto itemFormDto) {
        Item item = new Item();
        item.setId(itemFormDto.getId());
        item.setName(itemFormDto.getItemName());
        item.setPrice(itemFormDto.getPrice());
        item.setStock(itemFormDto.getStock());
        item.setDescription(itemFormDto.getDescription());
        item.setCategory_id(itemFormDto.getCategory_id());
        item.setStatus(itemFormDto.getStatus());
        return item;
    }
}
