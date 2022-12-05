package com.linker.direct.cart.controller;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.cart.service.CartService;
import com.linker.direct.common.util.SearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;

// 모달 안에 보여줄 장바구니 목록
@Controller
@RequestMapping("/cart/*")
public class CartController {

    private final static Logger logger = LoggerFactory.getLogger(CartController.class);

    @Inject
    private CartService cartService;

    // 장바구니 목록 보여주기
    @ResponseBody
    @RequestMapping(value = "/cartList", method = RequestMethod.GET)
    public ModelAndView cartList() throws Exception {
        // 모달 창 안에 장바구니 목록 보여주기
        ModelAndView mav = new ModelAndView("common/cartList");
        mav.addObject("cartList", cartService.CartList());
        logger.info("CartController cartList() 장바구니 목록 보여주기..");

        return mav;

    }

    // 장바구니 추가
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(CartDTO cartDTO) throws Exception {

        logger.info("CartController insert() 장바구니 추가..");
        cartService.insert(cartDTO);
        return "redirect:/cart/cartList";
    }

    //장바구니 삭제
    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
    public String deleteCart(int cart_id) throws Exception {

        logger.info("CartController deleteCart() 장바구니 삭제..");
        cartService.deleteCart(cart_id);
        return "redirect:/cart/cartList";
    }

    //장바구니 전체 삭제
    @RequestMapping(value = "/deleteAllCart", method = RequestMethod.POST)
    public String deleteAllCart(String user_id) throws Exception {

        logger.info("CartController deleteAllCart() 장바구니 전체 삭제..");
        cartService.deleteAllCart(user_id);
        return "redirect:/cart/cartList";
    }

}