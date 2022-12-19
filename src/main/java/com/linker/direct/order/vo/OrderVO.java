package com.linker.direct.order.vo;

import com.linker.direct.order.OrderStatus;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter @Setter
public class OrderVO { // 주문 정보
    private Long order_id;
    private Long user_id;
    private Timestamp order_date;
    private String msg;
    private String receiver;
    private String phone;
    private String address;
    private String address_detail;
    private String zip_code;
    private OrderStatus status;

    //================================================================================================

    private int total_price;

    public OrderVO() { }

    // 상품 추가되면, total_price 계산
    public void addItem(OrderItemVO orderItemVO) {
        this.total_price += orderItemVO.getPrice();
    }
}
