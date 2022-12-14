package com.linker.direct.order.service;

import com.linker.direct.order.vo.OrderItemVO;

public interface OrderItemService {
    void create(OrderItemVO orderItemVO) throws Exception;
}
