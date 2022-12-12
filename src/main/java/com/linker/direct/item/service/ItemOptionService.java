package com.linker.direct.item.service;

import com.linker.direct.item.vo.ItemOptionVO;

public interface ItemOptionService {
    void create(ItemOptionVO itemOptionVO) throws Exception;

    ItemOptionVO read(ItemOptionVO itemOptionVO) throws Exception;
}
