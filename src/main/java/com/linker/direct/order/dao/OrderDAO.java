package com.linker.direct.order.dao;

import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderSendDTO;
import com.linker.direct.order.vo.OrderVO;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface OrderDAO {
    void create(OrderSendDTO orderSendDTO) throws DataAccessException;

    void update(OrderSendDTO orderSendDTO) throws DataAccessException;

    List<OrderDTO> myOrderList(Long user_id) throws DataAccessException;
}
