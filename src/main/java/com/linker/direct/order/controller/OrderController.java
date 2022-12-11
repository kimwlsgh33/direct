package com.linker.direct.order.controller;

import com.linker.direct.item.service.ItemService;
import com.linker.direct.item.vo.Item;
import com.linker.direct.order.service.OrderItemService;
import com.linker.direct.order.vo.Order;
import com.linker.direct.order.service.OrderService;
import com.linker.direct.order.vo.OrderItem;
import com.linker.direct.user.service.UserService;
import com.linker.direct.user.vo.User;
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
    public String createForm(Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "order/createForm";
    }

    @RequestMapping("/create")
    public String create(HttpServletRequest request) throws Exception { //TODO: Order 객체, itemList 받아오기
        //TEST: 임시로 주문 생성
        Order order = new Order();

        // 유저 정보 가져옴
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        order.setUser_id(user.getUser_id());

        // 주문 정보 생성
        orderService.create(order);

        OrderItem orderItem = new OrderItem();

        //TEST: 임시로 상품 생성
        Item forItemId = new Item();
        forItemId.setItem_id(1L);

        // 상품 정보 가져옴
        Item item = itemService.read(forItemId);
        orderItem.setOrder_id(order.getOrder_id());
        orderItem.setItem_id(item.getItem_id());
        orderItem.setCount(1);
        orderItem.setPrice(item.getPrice());
        System.out.println(orderItem.toString());

        // 주문 아이템 생성
        orderItemService.create(orderItem);

        // 주문 아이템 추가 되었으므로, total_price 업데이트
        order.addItem(orderItem);

        System.out.println(order.toString());

        // 주문 정보 수정
        // orderService.update(order);

        return "order/list";
    }

    @RequestMapping("/list")
    public String order() {
        return "order/list";
    }
}
