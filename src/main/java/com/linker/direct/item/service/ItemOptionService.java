package com.linker.direct.item.service;

import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;

public interface ItemOptionService {
    void create(ItemOptionVO itemOptionVO) throws Exception;

    ItemOptionVO read(ItemOptionVO itemOptionVO) throws Exception;
    
    //public ItemOptionVO readByItem(ItemVO itemVO) throws Exception;
}
