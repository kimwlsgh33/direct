package com.linker.review.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component("boardDTO")
@Data // getter, setter, toString, (hash)Map
public class ReviewDTO {
	
	private int review_no;	// 리뷰 고유 번호
	private Long user_id;	// 유저 고유 번호
	private int product_no;	// 리뷰할 상품 번호
	private int rating;	// 구매 평점
	private String img_url;	// 상품 이미지url
	private String subject;	// 리뷰 제목
	private String content;	// 리뷰 내용
	private Timestamp reg_date;	// 리뷰 작성 날짜
	
	//mapper에서 alias로 사용, 실제 sql table에는 column없음
	private int cnt;	// 댓글 개수
	private String item_name;	// 상품 이름

}
