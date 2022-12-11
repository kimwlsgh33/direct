package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrderDaoImpl implements OrderDao {
    private static final String NAMESPACE = "order";

    private final SqlSession sqlSession;

    @Override
    public void create(OrderVO orderVO) throws DataAccessException {
        sqlSession.insert(NAMESPACE + ".create", orderVO);
    }
}
