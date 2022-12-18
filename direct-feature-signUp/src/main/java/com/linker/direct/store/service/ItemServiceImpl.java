package com.linker.direct.store.service;

import com.linker.direct.store.entity.Item;
import com.linker.direct.store.repo.ItemRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ItemServiceImpl implements ItemService {

    private final ItemRepo itemRepo;

    ItemServiceImpl(ItemRepo itemRepo) {
        this.itemRepo = itemRepo;
    }

    @Override
    public void get(Item item) throws Exception {
        log.info("ItemServiceImpl create() 실행");
        itemRepo.create(item);
    }


}
