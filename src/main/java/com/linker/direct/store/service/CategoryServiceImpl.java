package com.linker.direct.store.service;

import com.linker.direct.store.dao.CategoryDao;
import com.linker.direct.store.entity.Category;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryDao categoryDao;

    @Override
    public List<Category> listAll() throws Exception {
        return categoryDao.listAll();
    }

    @Override
    public void create(Category category) throws Exception {
        categoryDao.create(category);
    }

    @Override
    public Category read(int id) throws Exception {
        return categoryDao.read(id);
    }

    @Override
    public void update(Category category) throws Exception {
        categoryDao.update(category);
    }

    @Override
    public void delete(int id) throws Exception {
        categoryDao.delete(id);
    }
}
