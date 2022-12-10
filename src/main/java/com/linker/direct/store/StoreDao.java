package com.linker.direct.store;

import org.springframework.dao.DataAccessException;

import java.util.List;

public interface StoreDao {
    List<Store> listAll() throws DataAccessException;
    void create(StoreFormDto storeFormDto) throws DataAccessException;
    Store read(StoreDto storeDto) throws DataAccessException;

    void update(StoreFormDto storeFormDto) throws DataAccessException;

    void delete(StoreDto storeDto) throws DataAccessException;
}
