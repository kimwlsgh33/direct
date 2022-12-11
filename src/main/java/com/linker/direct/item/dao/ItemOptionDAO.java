package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.item.vo.ItemOptionVO;

public interface ItemOptionDAO {
    void create(ItemOptionVO itemOptionVO);

    ItemVO read(ItemOptionVO itemOptionVO);
}
