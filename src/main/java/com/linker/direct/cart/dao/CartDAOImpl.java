package com.linker.direct.cart.dao;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.order.dto.OrderFormDTO;
import com.linker.direct.user.vo.UserVO;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class CartDAOImpl implements CartDAO {

    @Inject
    SqlSession sqlSession;

    private static String namespace = "com.linker.direct.cart";
    private static final Logger logger = LoggerFactory.getLogger(CartDAOImpl.class);

    @Override
    public List<CartDTO> CartList(UserVO userVO) throws Exception {
        logger.info("CartDAOImpl CartList() 장바구니 목록 가져오기.....");
        List<CartDTO> cartList = sqlSession.selectList(namespace + ".cartList");
        logger.info("CartDAOImpl CartList() Data ==> " + cartList);
        return cartList;
    }

    @Override
    public void addCart(CartDTO cartDTO) throws Exception {
        logger.info("CartDAOImpl insert() 장바구니 추가....");
        sqlSession.insert(namespace + ".addCart", cartDTO);
    }

    @Override
    public int deleteCart(long item_id) throws Exception {
        logger.info("CartDAOImpl delete() 장바구니 삭제....");
        int result = sqlSession.delete(namespace + ".deleteCart", item_id);
        logger.info("CartDAOImpl delete() Data ==> " + result);
        return result;
    }

    @Override
    public int deleteAllCart(long user_id) throws Exception {
        logger.info("CartDAOImpl deleteAll() 장바구니 전체 삭제....");
        int result = sqlSession.delete(namespace + ".deleteAllCart", user_id);
        logger.info("CartDAOImpl deleteAll() Data ==> " + result);
        return result;

    }

    @Override
    public int itemCount(long user_id) throws Exception {
        logger.info("CartDAOImpl itemCount() 장바구니 든 프로덕트 개수....");
        int result = sqlSession.selectOne(namespace + ".itemCount", user_id);
        logger.info("CartDAOImpl itemCount() Data ==> " + result);
        return result;
    }

    @Override
    public int plusCount(CartDTO cartDTO) throws Exception {
        logger.info("CartDAOImpl plusCount() 장바구니 든 프로덕트 개수....");
        int result = sqlSession.update(namespace + ".plusCount", cartDTO);
        logger.info("CartDAOImpl plusCount() Data ==> " + result);
        return result;
    }

    @Override
    public int minusCount(CartDTO cartDTO) throws Exception {
        logger.info("CartDAOImpl minusCount() 장바구니 든 프로덕트 개수....");
        int result = sqlSession.update(namespace + ".minusCount", cartDTO);
        logger.info("CartDAOImpl minusCount() Data ==> " + result);
        return result;
    }


    //================================================================================================
    // forOrder
    //================================================================================================
    public List<OrderFormDTO> forOrder(UserVO userVO) throws Exception {
        List<OrderFormDTO> cartList = sqlSession.selectList(namespace + ".forOrder", userVO);
        return cartList;
    }

}
