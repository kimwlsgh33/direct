package com.linker.direct.item.dao;

import com.linker.direct.item.vo.Item;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ItemDaoImpl implements ItemDao {
    private final SqlSession sqlSession;

    private static final String NAMESPACE = "com.linker.direct.item.dao.ItemDao.";

    @Override
    public void create(Item item) {
        sqlSession.insert(NAMESPACE + "create", item);
    }

    @Override
    public Item read(Item item) {
        return sqlSession.selectOne(NAMESPACE + "read", item);
    }
}
