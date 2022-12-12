package com.linker.direct.order.controller;

import com.linker.direct.item.service.ItemService;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.order.dto.OrderFormDTO;
import com.linker.direct.order.service.OrderItemService;
import com.linker.direct.order.vo.OrderVO;
import com.linker.direct.order.service.OrderService;
import com.linker.direct.order.vo.OrderItemVO;
import com.linker.direct.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final OrderItemService orderItemService;


    // Test용 메소드
    private final ItemService itemService;

    @RequestMapping("/createForm")
    public String createForm(Model model, HttpServletRequest request, OrderFormDTO orderFormDto) throws Exception {

        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("user");
        model.addAttribute("user", memberVO);

        return "order/createForm";
    }

    @RequestMapping("/create")
    public String create(HttpServletRequest request) throws Exception { //TODO: Order 객체, itemList 받아오기
        //TEST: 임시로 주문 생성
        OrderVO orderVO = new OrderVO();

        // 유저 정보 가져옴
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("user");
        orderVO.setUser_id(memberVO.getUser_id());

        // 주문 정보 생성
        orderService.create(orderVO);

        OrderItemVO orderItemVO = new OrderItemVO();

        //TEST: 임시로 상품 생성
        ItemVO forItemIdVO = new ItemVO();
        forItemIdVO.setItem_id(1L);

        // 상품 정보 가져옴
        ItemVO itemVO = itemService.read(forItemIdVO);
        orderItemVO.setOrder_id(orderVO.getOrder_id());
        orderItemVO.setItem_id(itemVO.getItem_id());
        orderItemVO.setCount(1);
        orderItemVO.setPrice(itemVO.getPrice());
        System.out.println(orderItemVO.toString());

        // 주문 아이템 생성
        orderItemService.create(orderItemVO);

        // 주문 아이템 추가 되었으므로, total_price 업데이트
        orderVO.addItem(orderItemVO);

        System.out.println(orderVO.toString());

        // 주문 정보 수정
        // orderService.update(order);

        return "order/list";
    }

    @RequestMapping("/list")
    public String order() {
        return "order/list";
    }
}
