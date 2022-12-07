package com.linker.direct.user.vo;

import com.linker.direct.common.Base;

public class FavoriteItem extends Base {
    private Long favorite_item_id;
    private Long user_id;
    private Long item_id;

    public FavoriteItem(Long favorite_item_id, Long user_id, Long item_id) {
        this.favorite_item_id = favorite_item_id;
        this.user_id = user_id;
        this.item_id = item_id;
    }
}
