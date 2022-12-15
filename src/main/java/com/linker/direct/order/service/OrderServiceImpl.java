package com.linker.direct.order.service;

import com.linker.direct.order.vo.OrderVO;
import com.linker.direct.order.dao.OrderDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderDAO orderDao;

    @Override
    public void create(OrderVO orderVO) throws Exception {
        orderDao.create(orderVO);
    }
}