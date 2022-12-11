package com.linker.direct.order.dto;

import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.order.vo.OrderItemVO;
import java.util.List;
public class OrderFormDto {
    private List<ItemVO> itemVOList; // 장바구니에 있는 아이템들
    private OrderItemVO orderItemVO;
}
