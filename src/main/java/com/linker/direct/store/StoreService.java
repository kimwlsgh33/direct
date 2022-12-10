package com.linker.direct.store;

import java.util.List;

public interface StoreService {
    List<Store> listAll() throws Exception;
    void create(StoreFormDto storeFormDto) throws Exception;

    Store read(StoreDto storeDto) throws Exception;

    void update(StoreFormDto storeFormDto) throws Exception;
    void delete(StoreDto storeDto) throws Exception;
}
