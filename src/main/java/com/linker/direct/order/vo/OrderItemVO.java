package com.linker.direct.order.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter @Setter
public class OrderItemVO {
    private Long order_id;
    private Long item_id;
    private int count;
    private int price;
    private Timestamp order_date;
}