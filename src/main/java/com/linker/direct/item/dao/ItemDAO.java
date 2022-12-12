package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemVO;

public interface ItemDAO {
    void create(ItemVO itemVO);

    ItemVO read(ItemVO itemVO);
}
