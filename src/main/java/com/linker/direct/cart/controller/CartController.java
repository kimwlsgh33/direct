package com.linker.direct.cart.controller;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.cart.service.CartService;
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
    public ModelAndView cartList(CartDTO cartDTO) throws Exception {  // 나중에 인자로 user_id를 받아야 함.
        // 모달 창 안에 장바구니 목록 보여주기

        ModelAndView mav = new ModelAndView();
        mav.setViewName("common/cartList");
        mav.addObject("cartList", cartService.CartList());
        mav.addObject("item_id", cartDTO.getItem_id());
        mav.addObject("user_id", cartDTO.getUser_id());
        mav.addObject("item_count", cartDTO.getItem_count());

        logger.info("CartController cartList() 장바구니 목록 보여주기.." + cartService.CartList());

        return mav;
    }

    // 장바구니 추가
    @RequestMapping(value = "/addCart", method = RequestMethod.POST)
    public String addCart(CartDTO cartDTO) throws Exception {
        logger.info("CartController addCart() 장바구니 추가...." );
        cartService.addCart(cartDTO);
        return "redirect:/search/searchList";
    }

    //장바구니 삭제
    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
    public String deleteCart(long item_id) throws Exception {

        logger.info("CartController deleteCart() 장바구니 삭제..");
        cartService.deleteCart(item_id);
        return "redirect:/cart/cartList";
    }

    //장바구니 전체 삭제
    @RequestMapping(value = "/deleteAllCart", method = RequestMethod.POST)
    public String deleteAllCart(long user_id) throws Exception {

        logger.info("CartController deleteAllCart() 장바구니 전체 삭제..");
        cartService.deleteAllCart(user_id);
        return "redirect:/cart/cartList";
    }

    @RequestMapping(value = "/itemCount", method = RequestMethod.GET)
    public int itemCount(long user_id) throws Exception {
        logger.info("CartController itemCount() 장바구니 든 프로덕트 개수..");
        int result =  cartService.itemCount(user_id);
        logger.info("CartController itemCount() 장바구니 든 프로덕트 개수.."+result);
        return result;
    }

}