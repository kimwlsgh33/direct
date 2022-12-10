package com.linker.direct.category;

import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CategoryDao {
    List<Category> listAll() throws DataAccessException;
    void create(Category category) throws DataAccessException;
    Category read(CategoryDto categoryDto) throws DataAccessException;
    void update(Category category) throws DataAccessException;
    void delete(CategoryDto categoryDto) throws DataAccessException;
}
