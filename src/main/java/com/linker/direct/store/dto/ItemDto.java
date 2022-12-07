package com.linker.direct.store.dto;

import com.linker.direct.store.vo.Item;
import com.linker.direct.user.vo.User;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ItemDto {
    private Integer id;
    private User user;
    private Item item;

    public static ItemDto of(User user, Item item) {
        ItemDto itemDto = new ItemDto();
        itemDto.id = null;
        itemDto.user = user;
        itemDto.item = item;
        return itemDto;
    }
}
