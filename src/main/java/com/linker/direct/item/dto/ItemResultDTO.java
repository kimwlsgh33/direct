package com.linker.direct.item.dto;

import com.linker.direct.item.ItemSellStatus;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@Getter @Setter
public class ItemResultDTO {
    private Long item_id; // 구분자
    private String name; // 상품명
    private int price;
    private int stock;
    private String description;
    private ItemSellStatus status; // 상품 판매 상태
    private Timestamp created_at;
    private Timestamp updated_at;
    private String category_name; // 카테고리 연결

    private List<ItemImgReadDTO> imgList;

    public static ItemResultDTO of(ItemDTO itemDTO) {
        System.out.println("ItemResultDTO.of()" + itemDTO.toString());
        ItemResultDTO itemResultDTO = new ItemResultDTO();
        itemResultDTO.setItem_id(itemDTO.getItemVO().getItem_id());
        itemResultDTO.setName(itemDTO.getItemVO().getName());
        itemResultDTO.setPrice(itemDTO.getItemVO().getPrice());
        itemResultDTO.setStock(itemDTO.getItemVO().getStock());
        itemResultDTO.setDescription(itemDTO.getItemVO().getDescription());
        itemResultDTO.setStatus(itemDTO.getItemVO().getStatus());
        itemResultDTO.setCreated_at(itemDTO.getItemVO().getCreated_at());
        itemResultDTO.setUpdated_at(itemDTO.getItemVO().getUpdated_at());
        itemResultDTO.setImgList(itemDTO.getImgList());
        return itemResultDTO;
    }
}
