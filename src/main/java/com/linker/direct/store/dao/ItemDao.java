package com.linker.direct.store.dao;

import com.linker.direct.store.vo.Item;

public interface ItemDao {
    void create(Item item);

    Item read(int id);
}
