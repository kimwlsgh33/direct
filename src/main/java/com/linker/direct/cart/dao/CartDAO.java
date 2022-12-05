package com.linker.direct.cart.dao;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.common.util.SearchCriteria;

import java.util.List;

public interface CartDAO {
    public List<CartDTO> CartList() throws Exception;

    // 장바구니 추가
    public void insertCart(CartDTO cartDTO) throws Exception;

    // 장바구니 삭제
    public int deleteCart(int cart_id) throws Exception;

    // 장바구니 전체 삭제
    public int deleteAllCart(String user_id) throws Exception;

}
