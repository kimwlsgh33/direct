package com.linker.direct.order;

import com.linker.direct.common.Base;
import com.linker.direct.order.OrderStatus;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class Order extends Base { // 주문 정보
    private Long order_id;
    private Long user_id;
    private int total_price;
    private OrderStatus status;

    public Order(Long order_id, Long user_id, int total_price, OrderStatus status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.total_price = total_price;
        this.status = status;
    }
}
