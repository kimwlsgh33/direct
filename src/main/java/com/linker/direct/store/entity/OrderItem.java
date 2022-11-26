package com.linker.direct.store.entity;

import com.linker.direct.store.constant.ItemSellStatus;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderItem extends Base{
    private String id;
    private Item item;
    private Order order;
    private int count;
    private int orderPrice;

    public static OrderItem createOrderItem(Item item, int count) { // 제품 주문
        OrderItem orderItem = new OrderItem();
        orderItem.setItem(item);
        orderItem.setCount(count);
        orderItem.setOrderPrice(item.getPrice());
        item.removeStock(count);
        return orderItem;
    }

    public int getTotalPrice() { // 주문 총 가격
        return orderPrice * count; // 주문 가격 * 주문 수량
    }

    public void cancel() { // 주문 취소
        getItem().addStock(count); // 재고 수량 원복
    }
}
