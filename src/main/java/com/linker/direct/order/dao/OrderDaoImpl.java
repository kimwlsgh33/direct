package com.linker.direct.order.dao;

import com.linker.direct.order.vo.Order;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrderDaoImpl implements OrderDao {
    private static final String NAMESPACE = "com.linker.direct.order.dao.OrderDao.";

    private final SqlSession sqlSession;

    @Override
    public void create(Order order) throws DataAccessException {
        sqlSession.insert(NAMESPACE + "create", order);
    }
}
