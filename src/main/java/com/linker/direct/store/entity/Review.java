package com.linker.direct.store.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter @EqualsAndHashCode
public class Review {
    private String id;
    private String content;
    private int rating;
    private String itemId;
    private String userId;

    public Review(String id, String content, int rating, String itemId, String userId) {
        this.id = id;
        this.content = content;
        this.rating = rating;
        this.itemId = itemId;
        this.userId = userId;
    }
}
