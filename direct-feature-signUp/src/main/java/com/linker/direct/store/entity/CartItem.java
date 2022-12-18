package com.linker.direct.store.entity;

import lombok.Getter;
import lombok.Setter;

// Entity 기본 형식
@Getter
@Setter
public class CartItem {
    private String id;
    private Cart cart;
    private Item item;
    private int quantity;

    public CartItem(String id, Cart cart, Item item, int quantity) {
        this.id = id;
        this.cart = cart;
        this.item = item;
        this.quantity = quantity;
    }
    // cart, item, quantity를 받아서 CartItem을 생성하는 메소드
//    public static CartItem createCartItem(Cart cart, Item item, int quantity) {
//        CartItem cartItem = new CartItem();
//        cartItem.setCart(cart);
//        cartItem.setItem(item);
//        cartItem.setQuantity(quantity);
//        return cartItem;
//    }
}
