package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ItemOptionDAOImpl implements ItemOptionDAO {
    private static final String NAMESPACE = "itemOption";
    private final SqlSession sqlSession;

    @Override
    public void create(ItemOptionVO itemOptionVO) throws DataAccessException {
        sqlSession.insert(NAMESPACE + ".create", itemOptionVO);
    }

    @Override
    public ItemOptionVO read(ItemOptionVO itemOptionVO) throws DataAccessException {
        return sqlSession.selectOne(NAMESPACE + ".read", itemOptionVO);
    }
    
    @Override
    public ItemOptionVO readByItem(ItemVO itemVO) throws DataAccessException {
    	return sqlSession.selectOne(NAMESPACE + ".read", itemVO);
    }
}
