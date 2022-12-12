package com.linker.direct.order.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderItemVO {
    private Long order_item_id;
    private Long order_id;
    private Long item_id;
    private Long item_option_id;
    private int count;
    private int price;
    private Timestamp order_date;
}