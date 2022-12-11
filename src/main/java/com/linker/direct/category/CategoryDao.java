package com.linker.direct.category;

import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CategoryDao {
    List<CategoryVO> listAll() throws DataAccessException;
    void create(CategoryVO categoryVO) throws DataAccessException;
    CategoryVO read(CategoryDto categoryDto) throws DataAccessException;
    void update(CategoryVO categoryVO) throws DataAccessException;
    void delete(CategoryDto categoryDto) throws DataAccessException;
}
