package com.linker.direct.user.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AddressDaoImpl implements AddressDao {
    private final SqlSession sqlSession;

    private static final String NAMESPACE = "com.linker.direct.user.dao.AddressDao.";

    @Override
    public List<Address> listAll(int user_id) throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + "listAll", user_id);
    }
}
