package com.linker.direct.item.service;

import com.linker.direct.item.dto.ItemImgReadDTO;
import com.linker.direct.item.dto.ItemImgSaveDTO;
import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.item.vo.ItemVO;

import java.util.List;

public interface ItemImgService {
    void upload(ItemImgSaveDTO itemImgSaveDto) throws Exception;
    List<ItemImgReadDTO> readByItem(ItemVO itemVO) throws Exception;

    String readImgFileUrl(String img_name) throws Exception;
}
