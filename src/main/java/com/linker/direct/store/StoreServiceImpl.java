package com.linker.direct.store;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {
    private final StoreDao storeDao;

    @Override
    public List<Store> listAll() throws Exception {
        return storeDao.listAll();
    }

    @Override
    public void create(StoreFormDto storeFormDto) {
        storeDao.create(storeFormDto);
    }

    @Override
    public Store read(StoreDto storeDto) throws Exception {
        return storeDao.read(storeDto);
    }

    @Override
    public void update(StoreFormDto storeFormDto) throws Exception {
        storeDao.update(storeFormDto);
    }

    @Override
    public void delete(StoreDto storeDto) throws Exception {
        storeDao.delete(storeDto);
    }
}
