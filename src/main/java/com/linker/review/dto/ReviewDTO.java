package com.linker.review.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component("boardDTO")
@Data // getter, setter, toString, (hash)Map
public class ReviewDTO {
	
	private int review_no;	// 리뷰 고유 번호
	private String id;	// 리뷰 작성 유저 아이디
	private int product_no;	// 리뷰할 상품 번호
	private String subject;	// 리뷰 제목
	private String content;	// 리뷰 내용
	private Date reg_date;	// 리뷰 작성 날짜

}
