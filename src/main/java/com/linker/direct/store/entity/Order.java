package com.linker.direct.store.entity;

import com.linker.direct.store.constant.OrderStatus;
import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

// DB - order
@Getter @Setter
public class Order extends Base{ // 주문 정보
    private String id;
    private User user;
    private LocalDateTime orderTime;
    private OrderStatus orderStatus;
    private List<OrderItem> orderItems = new ArrayList<>();

    public void addOrderItem(OrderItem orderItem) {
        orderItems.add(orderItem);
        orderItem.setOrder(this);
    }

    public static Order createOrder(User user, List<OrderItem> orderItemList) { // 주문 정보 생성
        Order order = new Order(); // 주문 정보 생성
        order.setUser(user); // 사용자 정보 연결

        for(OrderItem item : orderItemList) { // 주문한 아이템들을 order 객체에 추가
            order.addOrderItem(item);
        }

        order.setOrderStatus(OrderStatus.ORDER); // 주문 상태 설정
        order.setOrderTime(LocalDateTime.now()); // 주문 시간 설정
        return order;
    }

    public int getTotalPrice() { // 주문 총 가격
        int totalPrice = 0;
        for(OrderItem orderItem : orderItems) { // for문을 통해 orderItems의 각각의 orderItem을 가져온다.
            totalPrice += orderItem.getTotalPrice();
        }
        return totalPrice;
    }

    public void cancelOrder() { // 주문 취소
        if(orderStatus == OrderStatus.CANCEL) { // 이미 주문 상태가 취소일 경우
            throw new IllegalStateException("이미 취소된 상품입니다.");
        }

        this.orderStatus = OrderStatus.CANCEL; // 주문 상태 - 취소
        for(OrderItem orderItem : orderItems) { // 주문 상품들 취소
            orderItem.cancel();
        }
    }
}
