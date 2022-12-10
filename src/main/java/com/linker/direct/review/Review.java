package com.linker.direct.review;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter @ToString
@EqualsAndHashCode
public class Review {
    private Long review_id;
    private Long user_id;
    private Long item_id;
    private int rating;
    private String content;
    private String review_img_url;
    private String status;

    public Review(Long review_id, Long user_id, Long item_id, int rating, String content, String review_img_url) {
        this.review_id = review_id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.rating = rating;
        this.content = content;
        this.review_img_url = review_img_url;
        this.status = "일반";
    }
}
