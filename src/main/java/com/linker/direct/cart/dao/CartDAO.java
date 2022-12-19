package com.linker.direct.cart.dao;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.order.dto.OrderFormDTO;
import com.linker.direct.user.vo.UserVO;

import java.util.List;

public interface CartDAO {
    public List<CartDTO> CartList(UserVO userVO) throws Exception;

    // 장바구니 추가
    public void addCart(CartDTO cartDTO) throws Exception;

    // 장바구니 삭제
    public int deleteCart(long item_id) throws Exception;

    // 장바구니 전체 삭제
    public int deleteAllCart(long user_id) throws Exception;

    // 장바구니 든 프로덕트 개수
    public int itemCount(long user_id) throws Exception;

    // 장바구니에 든 아이템 개수 플러스하기
    public int plusCount(CartDTO cartDTO) throws Exception;

    // 장바구니에 든 아이템 개수 줄이기
    public int minusCount(CartDTO cartDTO) throws Exception;


    public List<OrderFormDTO> forOrder(UserVO userVO) throws Exception;
}
