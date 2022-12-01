package com.linker.direct.store.dto;

import com.linker.direct.store.entity.Item;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

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
