package com.linker.direct.order.vo;

import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@EqualsAndHashCode
public class OrderItem extends Base {
    private Long order_item_id;
    private Long order_id;
    private Long item_id;
    private int count;
    private int price;
    private Long item_option_id;
}
