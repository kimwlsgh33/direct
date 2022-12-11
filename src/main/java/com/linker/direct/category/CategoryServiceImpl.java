package com.linker.direct.category;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryDao categoryDao;

    @Override
    public List<CategoryVO> listAll() throws Exception {
        return categoryDao.listAll();
    }

    @Override
    public void create(CategoryVO categoryVO) throws Exception {
        categoryDao.create(categoryVO);
    }

    @Override
    public CategoryVO read(CategoryDto categoryDto) throws Exception {
        return categoryDao.read(categoryDto);
    }

    @Override
    public void update(CategoryVO categoryVO) throws Exception {
        categoryDao.update(categoryVO);
    }

    @Override
    public void delete(CategoryDto categoryDto) throws Exception {
        categoryDao.delete(categoryDto);
    }
}
