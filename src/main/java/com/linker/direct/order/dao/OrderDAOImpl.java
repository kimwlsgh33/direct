package com.linker.direct.order.dao;

import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderSendDTO;
import com.linker.direct.order.vo.OrderVO;
import lombok.RequiredArgsConstructor;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OrderDAOImpl implements OrderDAO {
    private static final String NAMESPACE = "order";

    private final SqlSession sqlSession;

    @Override
    public void create(OrderSendDTO orderSendDTO) throws DataAccessException {
        sqlSession.insert(NAMESPACE + ".create", orderSendDTO);
    }

    @Override
    public void update(OrderSendDTO orderSendDTO) throws DataAccessException {
        sqlSession.update(NAMESPACE + ".update", orderSendDTO);
    }

    @Override
    public List<OrderDTO> myOrderList(Long user_id) throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + ".myOrderList", user_id);
    }
}
