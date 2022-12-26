package com.linker.direct.order.dto;

import com.linker.direct.order.vo.OrderItemVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class OrderSendDTO {
    private Long order_id;
    private Long user_id;
    private String receiver;
    private String phone;
    private String zip_code;
    private String address;
    private String address_detail;
    private String msg;
    private List<OrderItemVO> itemList;
    //================================================================================================

    private int total_price;
    // 상품 추가되면, total_price 계산
    public void addItem(OrderItemVO orderItemVO) {
        this.total_price += orderItemVO.getPrice();
    }
}
