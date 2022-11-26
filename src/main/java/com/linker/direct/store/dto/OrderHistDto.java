package com.linker.direct.store.dto;

import com.linker.direct.store.constant.OrderStatus;
import com.linker.direct.store.entity.Order;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OrderHistDto {
    public OrderHistDto(Order order){
        this.orderId = order.getId();
        this.orderDate = order.getOrderTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        this.orderStatus = order.getOrderStatus();
    }

    private String orderId;
    private String orderDate;
    private OrderStatus orderStatus;
    private List<OrderItemDto> orderItemDtoList = new ArrayList<>();

    public void addOrderItemDto(OrderItemDto orderItemDto){ // 주문 상품리스트
        orderItemDtoList.add(orderItemDto);
    }
}
