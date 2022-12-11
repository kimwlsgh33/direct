package com.linker.direct.item.service;


import com.linker.direct.item.dto.ItemFormDto;
import com.linker.direct.item.vo.Item;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDto itemFormDto, List<MultipartFile> uploadFiles) throws Exception;

    Item read(Item item) throws Exception;
}
