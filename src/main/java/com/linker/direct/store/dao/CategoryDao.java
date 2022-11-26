package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Category;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CategoryDao {
    List<Category> listAll() throws DataAccessException;
    void create(Category category) throws DataAccessException;
    Category read(int id) throws DataAccessException;
    void update(Category category) throws DataAccessException;
    void delete(int id) throws DataAccessException;
}
