package com.linker.direct.store.entity;

import com.linker.direct.user.entity.User;
import lombok.Getter;
import lombok.Setter;

// DB - cart
@Getter
@Setter
public class Cart extends Base {
    private String id; // 카트 구분
    private User user; // 카트에 유저 연결

    public static Cart createCart(User user) {
        Cart cart = new Cart();
        cart.setUser(user);
        return cart;
    }
}
