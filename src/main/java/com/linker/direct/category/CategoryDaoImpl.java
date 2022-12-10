package com.linker.direct.category;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CategoryDaoImpl implements CategoryDao {

    private static final String NAMESPACE = "com.linker.direct.store.dao.CategoryMapper.";
    private final SqlSession sqlSession;

    public CategoryDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Category> listAll() throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + "listAll");
    }

    @Override
    public void create(Category category) throws DataAccessException {
        sqlSession.insert(NAMESPACE + "create", category);
    }

    @Override
    public Category read(CategoryDto categoryDto) throws DataAccessException {
        Category category = categoryDto.toVo();
        return sqlSession.selectOne(NAMESPACE + "read", category);
    }

    @Override
    public void update(Category category) throws DataAccessException {
        sqlSession.update(NAMESPACE + "update", category);
    }

    @Override
    public void delete(CategoryDto categoryDto) throws DataAccessException {
        Category category = categoryDto.toVo();
        sqlSession.delete(NAMESPACE + ".delete", category);
    }
}
