package com.linker.direct.store.vo;

import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class OrderItem extends Base {
    private Long order_item_id;
    private Long order_id;
    private Long item_id;
    private int count;
    private int price;
    private Long item_option_id;

    public OrderItem(Long order_item_id, Long order_id, Long item_id, int count, int price, Long item_option_id) {
        this.order_item_id = order_item_id;
        this.order_id = order_id;
        this.item_id = item_id;
        this.count = count;
        this.price = price;
        this.item_option_id = item_option_id;
    }
}
