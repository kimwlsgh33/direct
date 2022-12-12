package com.linker.direct.cart.service;

import com.linker.direct.cart.dao.CartDAO;
import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.common.util.SearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);


    @Inject
    private CartDAO cartDAO;

    @Override
    public List<CartDTO> CartList() throws Exception {
        logger.info("CartServiceImpl CartList() 장바구니 목록 보여주기.....");
        List<CartDTO> cartList = cartDAO.CartList();
        logger.info("CartServiceImpl CartList() Data ==> " + cartList);
        return cartList;
    }

    @Override
    public void addCart(CartDTO cartDTO) throws Exception {
        logger.info("CartServiceImpl insert() 장바구니 추가....");
        cartDAO.addCart(cartDTO);
    }

    @Override
    public int deleteCart(long item_id) throws Exception {
        logger.info("CartServiceImpl delete() 장바구니 삭제....");
        return cartDAO.deleteCart(item_id);
    }

    @Override
    public int deleteAllCart(long user_id) throws Exception {
        logger.info("CartServiceImpl deleteAll() 장바구니 전체 삭제....");
        return cartDAO.deleteAllCart(user_id);
    }

    @Override
    public int itemCount(long user_id) throws Exception {
        logger.info("CartServiceImpl cartCount() 장바구니 든 프로덕트 개수....");
        return cartDAO.itemCount(user_id);
    }
}
