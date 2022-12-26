package com.linker.direct.order.service;

import com.linker.direct.order.vo.OrderVO;
import com.linker.direct.item.service.ItemImgService;
import com.linker.direct.order.dao.OrderDAO;
import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderSendDTO;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderDAO orderDao;
    private final ItemImgService itemImgService;

    @Override
    public void create(OrderSendDTO orderSendDTO) throws Exception {
        orderDao.create(orderSendDTO);
    }

    @Override
    public void update(OrderSendDTO orderSendDTO) throws Exception {
        orderDao.update(orderSendDTO);
    }

    @Override
    public List<OrderDTO> myOrderList(Long user_id) throws Exception {
        List<OrderDTO> results = orderDao.myOrderList(user_id);

        for(OrderDTO orderDTO : results) {
            orderDTO.setImg_url(itemImgService.readImgFileUrl(orderDTO.getImg_url()));
        }

        return results;
    }
}
