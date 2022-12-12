package com.linker.direct.item.service;

import com.linker.direct.item.dto.ItemImgDTO;
import com.linker.direct.item.vo.ItemImgVO;

import java.util.List;

public interface ItemImgService {
    void upload(ItemImgDTO itemImgDto) throws Exception;

    List<ItemImgVO> read(int id) throws Exception;
}
