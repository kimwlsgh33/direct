package com.linker.direct.order.vo;

import com.linker.direct.order.OrderStatus;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderVO { // 주문 정보
    private Long order_id;
    private Long user_id;
    private int total_price;
    private OrderStatus status;
    private Timestamp order_date;

    public OrderVO() { }

    // 상품 추가되면, total_price 계산
    public void addItem(OrderItemVO orderItemVO) {
        this.total_price += orderItemVO.getPrice();
    }
}
