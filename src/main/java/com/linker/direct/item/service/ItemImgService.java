package com.linker.direct.item.service;

import com.linker.direct.item.dto.ItemImgDto;
import com.linker.direct.item.vo.ItemImg;

import java.util.List;

public interface ItemImgService {
    void upload(ItemImgDto itemImgDto) throws Exception;

    List<ItemImg> read(int id) throws Exception;
}
