package com.linker.direct.category;

import com.linker.direct.item.vo.ItemVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface CategoryDAO {
    List<CategoryVO> listAll() throws DataAccessException;
    void create(CategoryVO categoryVO) throws DataAccessException;
    CategoryVO read(CategoryDTO categoryDto) throws DataAccessException;
    void update(CategoryVO categoryVO) throws DataAccessException;
    void delete(CategoryDTO categoryDto) throws DataAccessException;

    CategoryVO readByItem(ItemVO itemVO) throws DataAccessException;
}
