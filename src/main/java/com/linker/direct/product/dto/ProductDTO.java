package com.linker.direct.product.dto;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component("ProductDTO")	// 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도 됨
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
@Data
public class ProductDTO {
	
	private Long user_id;	// 구매자 고유 아이디PK
	// 주문한 유저 id;
	private Long item_id;	// 상품 번호
	private Long order_id;	// 주문 번호
	private int count;	// 구매한 상품 갯수
	private int price;	// 구매한 상품 가격
	private String name;	// 구매한 상품 이름
	private Timestamp order_date;	// 구매 날짜
	private String item_url;	// 구매한 상품 이미지 경로
	
	// 쿼리문으로 만든 column, mysql테이블에는 없음
	private String u_name;	// 사용자 이름
	private String address;	// 사용자 주소
	private String phone;	// 사용자 연락처
	private String zip_code;
	private String address_detail;

	// 환불 취소 반품
	private String status;
}