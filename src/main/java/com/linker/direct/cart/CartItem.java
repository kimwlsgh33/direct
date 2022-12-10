package com.linker.direct.cart;

import com.linker.direct.common.Base;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class CartItem extends Base { // 사용자가 카트에 담은 상품
    private Long cart_item_id; // 카트 & 아이템 연동 객체 id
    private Long user_id; // 유저 연결
    private Long item_id; // 아이템 연결
    private int count; // 담긴 아이템 개수

    // 카트에 아이템 담기 ( 객체 생성 )
    public CartItem(Long cart_item_id, Long user_id, Long item_id, int count) {
        this.cart_item_id = cart_item_id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.count = count;
    }

    // 상품 개수 늘리기 (+)
    public void addQuantity(int count) {
        this.count += count;
    }

    // 상품 개수 설정 (=)
    public void updateQuantity(int count) {
        this.count = count;
    }
}
