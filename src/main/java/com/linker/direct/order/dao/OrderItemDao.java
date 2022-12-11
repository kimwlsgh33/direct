package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderItem;

public interface OrderItemDao {
    void create(OrderItem orderItem) throws Exception;
}
