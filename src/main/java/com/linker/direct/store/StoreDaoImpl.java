package com.linker.direct.store;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class StoreDaoImpl implements StoreDao {
    private static final String NAMESPACE = "com.linker.direct.store.StoreMapper.";
    private final SqlSession sqlSession;

    @Override
    public List<Store> listAll() throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + "listAll");
    }

    @Override
    public void create(StoreFormDto storeFormDto) throws DataAccessException {
        Store store = storeFormDto.toVo();
        sqlSession.insert(NAMESPACE + "create", store);
        System.out.println("store = " + store.toString());
    }

    @Override
    public Store read(StoreDto storeDto) throws DataAccessException {
        Store store = storeDto.toVo();
        return sqlSession.selectOne(NAMESPACE + "read", store);
    }

    @Override
    public void update(StoreFormDto storeFormDto) throws DataAccessException {
        Store store = storeFormDto.toVo();
        sqlSession.update(NAMESPACE + "update", store);
    }

    @Override
    public void delete(StoreDto storeDto) throws DataAccessException {
        Store store = storeDto.toVo();
        sqlSession.delete(NAMESPACE + "delete", store);
    }
}
