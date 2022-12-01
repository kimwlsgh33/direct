package com.linker.direct.store.service;

import com.linker.direct.store.dto.ItemImgDto;
import com.linker.direct.store.entity.ItemImg;

import java.util.List;

public interface ItemImgService {
    void upload(ItemImgDto itemImgDto) throws Exception;

    List<ItemImg> read(int id) throws Exception;
}
