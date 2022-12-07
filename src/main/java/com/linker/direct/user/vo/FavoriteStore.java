package com.linker.direct.user.vo;

import com.linker.direct.common.Base;

public class FavoriteStore extends Base {
    private Long favorite_store_id;
    private Long user_id;
    private Long store_id;

    public FavoriteStore(Long favorite_store_id, Long user_id, Long store_id) {
        this.favorite_store_id = favorite_store_id;
        this.user_id = user_id;
        this.store_id = store_id;
    }
}
