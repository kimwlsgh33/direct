package com.linker.direct.category;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CategoryDaoImpl implements CategoryDao {

    private static final String NAMESPACE = "category";
    private final SqlSession sqlSession;

    public CategoryDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<CategoryVO> listAll() throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + ".listAll");
    }

    @Override
    public void create(CategoryVO categoryVO) throws DataAccessException {
        sqlSession.insert(NAMESPACE + ".create", categoryVO);
    }

    @Override
    public CategoryVO read(CategoryDto categoryDto) throws DataAccessException {
        CategoryVO categoryVO = categoryDto.toVo();
        return sqlSession.selectOne(NAMESPACE + ".read", categoryVO);
    }

    @Override
    public void update(CategoryVO categoryVO) throws DataAccessException {
        sqlSession.update(NAMESPACE + ".update", categoryVO);
    }

    @Override
    public void delete(CategoryDto categoryDto) throws DataAccessException {
        CategoryVO categoryVO = categoryDto.toVo();
        sqlSession.delete(NAMESPACE + ".delete", categoryVO);
    }
}
