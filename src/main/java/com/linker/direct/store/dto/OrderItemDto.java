package com.linker.direct.store.dto;

import com.linker.direct.store.entity.OrderItem;

public class OrderItemDto {
    public OrderItemDto(OrderItem orderItem, String imgUrl) {
        this.itemName = orderItem.getItem().getName();
        this.count = orderItem.getCount();
        this.orderPrice = orderItem.getOrderPrice();
        this.imgUrl = imgUrl;
    }

    private String itemName;
    private int count;
    private int orderPrice;
    private String imgUrl;
}
