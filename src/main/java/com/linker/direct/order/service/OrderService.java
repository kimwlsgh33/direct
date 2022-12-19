package com.linker.direct.order.service;

import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderSendDTO;

import java.util.List;

public interface OrderService {
    void create(OrderSendDTO orderSendDTO) throws Exception;

    void update(OrderSendDTO orderSendDTO) throws Exception;

    List<OrderDTO> myOrderList(Long user_id) throws Exception;
}
