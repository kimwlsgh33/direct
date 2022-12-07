package com.linker.direct.store.service;

import com.linker.direct.store.dao.CategoryDao;
import com.linker.direct.store.dto.CategoryDto;
import com.linker.direct.store.vo.Category;
import lombok.RequiredArgsConstructor;
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
    public Category read(CategoryDto categoryDto) throws Exception {
        return categoryDao.read(categoryDto);
    }

    @Override
    public void update(Category category) throws Exception {
        categoryDao.update(category);
    }

    @Override
    public void delete(CategoryDto categoryDto) throws Exception {
        categoryDao.delete(categoryDto);
    }
}
