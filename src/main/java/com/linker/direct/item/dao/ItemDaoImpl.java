package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ItemDaoImpl implements ItemDao {
    private final SqlSession sqlSession;

    private static final String NAMESPACE = "item";

    @Override
    public void create(ItemVO itemVO) {
        sqlSession.insert(NAMESPACE + ".create", itemVO);
    }

    @Override
    public ItemVO read(ItemVO itemVO) {
        return sqlSession.selectOne(NAMESPACE + ".read", itemVO);
    }
}
