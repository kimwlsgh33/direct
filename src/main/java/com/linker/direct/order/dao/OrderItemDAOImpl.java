package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderItemVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrderItemDAOImpl implements OrderItemDAO {

    private static final String NAMESPACE = "orderItem";
    private final SqlSession sqlSession;

    @Override
    public void create(OrderItemVO orderItemVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".create", orderItemVO);
    }
}