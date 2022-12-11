package com.linker.direct.order.service;

import com.linker.direct.order.vo.OrderItem;

public interface OrderItemService {
    void create(OrderItem orderItem) throws Exception;
}
