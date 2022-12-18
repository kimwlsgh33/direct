package com.linker.direct.cart.service;

import com.linker.direct.cart.dao.CartDAO;
import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.item.service.ItemImgService;
import com.linker.direct.order.dto.OrderFormDTO;
import com.linker.direct.user.vo.UserVO;
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

    // Jinho
    @Inject
    private ItemImgService itemImgService;

    @Override
    public List<CartDTO> CartList(UserVO user) throws Exception {
        List<CartDTO> cartList = cartDAO.CartList(user);
        return cartList;
    }

    @Override
    public void addCart(CartDTO cartDTO) throws Exception {
        cartDAO.addCart(cartDTO);
    }

    @Override
    public int deleteCart(long item_id) throws Exception {
        return cartDAO.deleteCart(item_id);
    }

    @Override
    public int deleteAllCart(long user_id) throws Exception {
        return cartDAO.deleteAllCart(user_id);
    }

    @Override
    public int itemCount(long user_id) throws Exception {
        return cartDAO.itemCount(user_id);
    }

    //================================================================================================
    // forOrder
    //================================================================================================
    public List<OrderFormDTO> forOrder(UserVO user) throws Exception {
        List<OrderFormDTO> cartList = cartDAO.forOrder(user);
        for(OrderFormDTO orderFormDTO: cartList){
            String fileUrl = itemImgService.readImgFileUrl(orderFormDTO.getImg_url());
            orderFormDTO.setImg_url(fileUrl);
        }
        return cartList;
    }
}