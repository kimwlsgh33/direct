package com.linker.direct.store.service;

import com.linker.direct.store.dao.ItemDao;
import com.linker.direct.store.entity.Item;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    private final ItemDao itemDao;

    @Override
    public List<Item> listAll() throws Exception {
        return itemDao.listAll();
    }

    @Override
    public void create(Item item) throws Exception {
        log.info("ItemServiceImpl/create() 실행");
        itemDao.create(item);
    }

    @Override
    public Item read(String id) throws Exception {
        log.info("ItemServiceImpl/read() 실행");
        return itemDao.read(id);
    }

    @Override
    public void update(Item item) throws Exception {
        log.info("ItemServiceImpl/update() 실행");
        itemDao.update(item);
    }

    @Override
    public void delete(String id) throws Exception {
        log.info("ItemServiceImpl/delete() 실행");
        itemDao.delete(id);
    }
}
