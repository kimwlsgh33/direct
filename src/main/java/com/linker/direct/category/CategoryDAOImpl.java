package com.linker.direct.category;

import com.linker.direct.item.vo.ItemVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CategoryDAOImpl implements CategoryDAO {

    private static final String NAMESPACE = "category";
    private final SqlSession sqlSession;

    public CategoryDAOImpl(SqlSession sqlSession) {
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
    public CategoryVO read(CategoryDTO categoryDto) throws DataAccessException {
        CategoryVO categoryVO = categoryDto.toVo();
        return sqlSession.selectOne(NAMESPACE + ".read", categoryVO);
    }

    @Override
    public void update(CategoryVO categoryVO) throws DataAccessException {
        sqlSession.update(NAMESPACE + ".update", categoryVO);
    }

    @Override
    public void delete(CategoryDTO categoryDto) throws DataAccessException {
        CategoryVO categoryVO = categoryDto.toVo();
        sqlSession.delete(NAMESPACE + ".delete", categoryVO);
    }

    @Override
    public String readByItem(ItemVO itemVO) throws DataAccessException {
        return sqlSession.selectOne(NAMESPACE + ".readNameByItem", itemVO);
    }
}
