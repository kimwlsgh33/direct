package com.linker.direct.store.service;

import com.linker.direct.store.entity.Item;

import java.util.List;

public interface ItemService {
    List<Item> listAll() throws Exception;
    void create(Item item) throws Exception;
    Item read(String id) throws Exception;
    void update(Item item) throws Exception;
    void delete(String id) throws Exception;
}
