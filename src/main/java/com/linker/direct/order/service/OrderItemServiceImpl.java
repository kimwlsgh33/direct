package com.linker.direct.order.service;

import com.linker.direct.order.dao.OrderItemDAO;
import com.linker.direct.order.vo.OrderItemVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderItemServiceImpl implements OrderItemService {
    private final OrderItemDAO orderItemDao;

    @Override
    public void create(OrderItemVO orderItemVO) throws Exception {
        orderItemDao.create(orderItemVO);
    }
}
