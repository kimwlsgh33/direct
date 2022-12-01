package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Item;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ItemDaoImpl implements ItemDao {
    private final SqlSession sqlSession;

    private final String NAMESPACE = "com.linker.direct.store.dao.ItemDao.";

    @Override
    public void create(Item item) {
        sqlSession.insert(NAMESPACE + "create", item);
    }

    @Override
    public Item read(int id) {
        return sqlSession.selectOne(NAMESPACE + "read", id);
    }
}
