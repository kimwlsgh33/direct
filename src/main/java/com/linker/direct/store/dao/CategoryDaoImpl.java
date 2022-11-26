package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Category;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class CategoryDaoImpl implements CategoryDao {

    private final String NAMESPACE = "CategoryMapper";
    private final SqlSession sqlSession;

    public CategoryDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Category> listAll() throws DataAccessException {
        log.info("CategoryDao/listAll() 실행");
        return sqlSession.selectList(NAMESPACE + ".listAll");
    }

    @Override
    public void create(Category category) throws DataAccessException {
        log.info("CategoryDao/create() 실행");
        sqlSession.insert(NAMESPACE + ".create", category);
    }

    @Override
    public Category read(int id) throws DataAccessException {
        log.info("CategoryDao/read() 실행");
        return sqlSession.selectOne(NAMESPACE + ".read", id);
    }

    @Override
    public void update(Category category) throws DataAccessException {
        log.info("CategoryDao/update() 실행");
        sqlSession.update(NAMESPACE + ".update", category);
    }

    @Override
    public void delete(int id) throws DataAccessException {
        log.info("CategoryDao/delete() 실행");
        sqlSession.delete(NAMESPACE + ".delete", id);
    }
}
