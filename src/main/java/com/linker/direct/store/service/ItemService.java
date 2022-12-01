package com.linker.direct.store.service;


import com.linker.direct.store.dto.ItemFormDto;
import com.linker.direct.store.entity.Item;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDto itemFormDto, List<MultipartFile> uploadFiles) throws Exception;

    Item read(int id) throws Exception;
}
