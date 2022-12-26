package com.linker.direct.order.controller;

//vo
import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.cart.service.CartService;
import com.linker.direct.order.vo.OrderVO;
import com.linker.direct.order.vo.OrderItemVO;
import com.linker.direct.user.vo.UserVO;
import com.linker.direct.util.address.AddressService;
import com.linker.direct.item.vo.ItemVO;
// service
import com.linker.direct.item.service.ItemService;
import com.linker.direct.order.service.OrderService;
import com.linker.direct.order.dto.OrderDTO;
import com.linker.direct.order.dto.OrderFormDTO;
import com.linker.direct.order.dto.OrderSendDTO;
import com.linker.direct.order.service.OrderItemService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;
    private final OrderItemService orderItemService;
    private final AddressService addressService;

    private final CartService cartService;


    // Test용 메소드
    private final ItemService itemService;

    @RequestMapping("/createForm") // 요기 - 장바구니 아이템 받아서, 주문 생성화면으로 이동
    public String createForm(HttpServletRequest request, Model model) throws Exception {
        // List<CartDTO> cartList = orderService.getCartList();
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("user");
        model.addAttribute("user", userVO);

        List<OrderFormDTO> cartList = cartService.forOrder(userVO);
        int totalPrice = 0;
        for(OrderFormDTO cart : cartList) {
            totalPrice += cart.getTotalPrice();
        }
        model.addAttribute("cartList", cartList);
        model.addAttribute("totalPrice", totalPrice);

        return "order/create";
    }

    @RequestMapping("/create")
    public String create(HttpServletRequest request,OrderSendDTO orderSendDTO) throws Exception { //TODO: Order 객체, itemList 받아오기

        // 유저 정보 가져옴
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("user");
        orderSendDTO.setUser_id(userVO.getUser_id());

        // 주문 정보 생성
        orderService.create(orderSendDTO);

        for(OrderItemVO orderItemVO : orderSendDTO.getItemList()) {
            orderItemVO.setOrder_id(orderSendDTO.getOrder_id());
            // 주문 아이템 생성
            orderItemService.create(orderItemVO);
            // 주문 아이템 추가 되었으므로, total_price 업데이트
            orderSendDTO.addItem(orderItemVO);
        }

        // 주문 정보 수정
         // orderService.update(orderSendDTO);
        cartService.deleteAllCart(userVO.getUser_id());

        return "redirect:order/list";
    }

    @RequestMapping("/list")
    public String order(Model model, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        UserVO userVO = (UserVO) session.getAttribute("user");
        List<OrderDTO> orderList = orderService.myOrderList(userVO.getUser_id());

        model.addAttribute("orderList", orderList);

        return "order/list";
    }
}
