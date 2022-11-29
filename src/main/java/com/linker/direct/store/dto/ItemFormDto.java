package com.linker.direct.store.dto;

import com.linker.direct.store.entity.Item;
import com.linker.direct.store.entity.ItemImg;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter @Setter
public class ItemFormDto {
    private Integer id;
    private String itemName;
    private int price;
    private int stock;
    private String description;
    private Integer category_id;
    private MultipartFile[] itemImgList;

    public static ItemFormDto of(Item item, MultipartFile[] itemImgList) {
        ItemFormDto itemFormDto = new ItemFormDto();
        itemFormDto.setId(item.getId());
        itemFormDto.setItemName(item.getName());
        itemFormDto.setPrice(item.getPrice());
        itemFormDto.setStock(item.getStock());
        itemFormDto.setDescription(item.getDescription());
        itemFormDto.setCategory_id(item.getCategory_id());
        itemFormDto.setItemImgList(itemImgList);
        return itemFormDto;
    }
}
