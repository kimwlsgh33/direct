package com.linker.direct.order.vo;

import com.linker.direct.common.Base;
import com.linker.direct.order.OrderStatus;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@EqualsAndHashCode
public class Order extends Base { // 주문 정보
    private Long order_id;
    private Long user_id;
    private int total_price;
    private OrderStatus status;

    public Order() { }

    // 상품 추가되면, total_price 계산
    public void addItem(OrderItem orderItem) {
        this.total_price += orderItem.getPrice();
    }
}
