package com.linker.direct.store.repo;

import com.linker.direct.store.entity.Item;
import org.springframework.dao.DataAccessException;

public interface ItemRepo {
    void create(Item item) throws DataAccessException;
}
