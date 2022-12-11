package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemVO;

public interface ItemDao {
    void create(ItemVO itemVO);

    ItemVO read(ItemVO itemVO);
}
