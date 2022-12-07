package com.linker.direct.store.dao;

import com.linker.direct.store.vo.Category;
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
    public Category read(int id) throws DataAccessException {
        return sqlSession.selectOne(NAMESPACE + "read", id);
    }

    @Override
    public void update(Category category) throws DataAccessException {
        sqlSession.update(NAMESPACE + "update", category);
    }

    @Override
    public void delete(int id) throws DataAccessException {
        sqlSession.delete(NAMESPACE + ".delete", id);
    }
}
