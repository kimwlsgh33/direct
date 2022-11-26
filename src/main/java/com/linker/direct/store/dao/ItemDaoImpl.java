package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Item;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
public class ItemDaoImpl implements ItemDao {
    private final String NAMESPACE = "itemMapper";

    private final SqlSession sqlSession;

    ItemDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Item> listAll() throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + ".listAll");
    }

    @Override
    public void create(Item item) throws DataAccessException {
        log.info("ItemDaoImpl create() 실행");
        sqlSession.insert(NAMESPACE + ".create", item);
    }

    @Override
    public Item read(String id) throws DataAccessException {
        log.info("ItemDaoImpl read() 실행");
        return sqlSession.selectOne(NAMESPACE + ".read", id);
    }

    @Override
    public void update(Item item) throws DataAccessException {
        log.info("ItemDaoImpl update() 실행");
        sqlSession.update(NAMESPACE + ".update", item);
    }

    @Override
    public void delete(String id) throws DataAccessException {
        log.info("ItemDaoImpl delete() 실행");
        sqlSession.delete(NAMESPACE + ".delete", id);
    }
}
