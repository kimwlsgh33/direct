package com.linker.direct.store.entity;

import lombok.Getter;
import lombok.Setter;

// DB = cart_item
@Getter
@Setter
public class CartItem { // 사용자가 카트에 담은 상품
    private String id; // 카트 & 아이템 연동 객체 id
    private Cart cart; // 카트 연결
    private Item item; // 아이템 연결
    private int quantity; // 담긴 아이템 개수

    // 카트에 아이템 담기 ( 객체 생성 )
    public CartItem(String id, Cart cart, Item item, int quantity) {
        this.id = id;
        this.cart = cart;
        this.item = item;
        this.quantity = quantity;
    }

    // 상품 개수 늘리기 (+)
    public void addQuantity(int quantity) {
        this.quantity += quantity;
    }

    // 상품 개수 설정 (=)
    public void updateQuantity(int quantity) {
        this.quantity = quantity;
    }
}
