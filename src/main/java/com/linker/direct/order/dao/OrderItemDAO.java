package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderItemVO;

public interface OrderItemDAO {
    void create(OrderItemVO orderItemVO) throws Exception;
}
