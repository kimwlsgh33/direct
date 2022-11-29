package com.linker.direct.store.dto;

import com.linker.direct.store.entity.Item;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

@Getter
public class ItemDto {
    private User user;
    private Item item;

    public static ItemDto of(User user, Item item) {
        ItemDto itemDto = new ItemDto();
        itemDto.user = user;
        itemDto.item = item;
        return itemDto;
    }
}
