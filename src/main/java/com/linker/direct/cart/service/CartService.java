package com.linker.direct.cart.service;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.common.util.SearchCriteria;

import java.util.List;

public interface CartService {

    // 장바구니 목록 보여주기
    public List<CartDTO> CartList() throws Exception;

    // 장바구니 추가
    public void addCart(CartDTO cartDTO) throws Exception;

    //장바구니 삭제
    public int deleteCart(int product_id) throws Exception;

    //장바구니 전체 삭제
    public int deleteAllCart(String user_id) throws Exception;

    //장바구니 든 프로덕트 개수
    public int cartCount(int user_id) throws Exception;
}
