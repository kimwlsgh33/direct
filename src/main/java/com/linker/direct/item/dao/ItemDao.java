package com.linker.direct.item.dao;

import com.linker.direct.item.vo.Item;

public interface ItemDao {
    void create(Item item);

    Item read(int id);
}
