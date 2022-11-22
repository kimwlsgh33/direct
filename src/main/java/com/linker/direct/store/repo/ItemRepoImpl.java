package com.linker.direct.store.repo;

import com.linker.direct.store.dao.ItemDao;
import com.linker.direct.store.entity.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class ItemRepoImpl implements ItemRepo {

    private final ItemDao itemDao;

    ItemRepoImpl(ItemDao itemDao) {
        this.itemDao = itemDao;
    }

    @Override
    public void create(Item item) throws DataAccessException {
        log.info("ItemRepoImpl create() 실행");
        itemDao.create(item);
    }
}
