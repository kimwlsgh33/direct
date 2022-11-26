package com.linker.direct.store.service;

import com.linker.direct.store.dao.CategoryDao;
import com.linker.direct.store.entity.Category;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryDao categoryDao;

    @Override
    public List<Category> listAll() throws Exception {
        log.info("CategoryService/listAll() 호출");
        return categoryDao.listAll();
    }

    @Override
    public void create(Category category) throws Exception {
        log.info("CategoryService/create() 호출");
        categoryDao.create(category);
    }

    @Override
    public Category read(int id) throws Exception {
        log.info("CategoryService/read() 호출");
        return categoryDao.read(id);
    }

    @Override
    public void update(Category category) throws Exception {
        log.info("CategoryService/update() 호출");
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) throws Exception {
        log.info("CategoryService/delete() 호출");
        categoryDao.delete(id);
    }
}
