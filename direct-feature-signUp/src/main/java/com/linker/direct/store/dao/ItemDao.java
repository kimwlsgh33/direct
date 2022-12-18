package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Item;
import org.springframework.dao.DataAccessException;

public interface ItemDao {
    void create(Item item) throws DataAccessException;
}
