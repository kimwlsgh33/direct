package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderItem;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrderItemDaoImpl implements OrderItemDao {

    private static final String NAMESPACE = "com.linker.direct.order.dao.OrderItemDao.";
    private final SqlSession sqlSession;

    @Override
    public void create(OrderItem orderItem) throws Exception {
        sqlSession.insert(NAMESPACE + "create", orderItem);
    }
}
