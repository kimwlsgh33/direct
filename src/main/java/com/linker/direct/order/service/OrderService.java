package com.linker.direct.order.service;

import com.linker.direct.order.vo.Order;

public interface OrderService {
    void create(Order order) throws Exception;
}
