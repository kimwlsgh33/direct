package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Item;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ItemDaoImpl implements ItemDao {

    private final SqlSession sqlSession;

    ItemDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void create(Item item) throws DataAccessException {
        log.info("ItemDaoImpl create() 실행");
        sqlSession.insert("ItemMapper.create", item);
    }
}
