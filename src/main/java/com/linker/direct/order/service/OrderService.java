package com.linker.direct.order.service;

import java.util.List;

import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderSendDTO;

public interface OrderService {
    void create(OrderSendDTO orderSendDTO) throws Exception;

    void update(OrderSendDTO orderSendDTO) throws Exception;

    List<OrderDTO> myOrderList(Long user_id) throws Exception;
}
