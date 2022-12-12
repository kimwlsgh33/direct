package com.linker.direct.order.service;

import com.linker.direct.order.vo.OrderVO;

public interface OrderService {
    void create(OrderVO orderVO) throws Exception;
}
