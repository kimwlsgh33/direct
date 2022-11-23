package com.linker.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("memberVO")	// 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도 됨
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
@Data
public class MemberVO {	
	
	private String id;	// 사용자 아이디
	private String name;	// 사용자 이름
	private String address;	// 사용자 주소
	private String password;	// 사용자 비밀번호
	private String product;	// 상품
	private String review;	// 사용자 리뷰
	private Date joinDate;	// 가입일자
	private String email;	// 사용자 이메일

	public MemberVO() {}	// 기본 생성자
	public MemberVO(String id, String name, String address, String password, String product, String review, String email) {	// 매개변수 있는 생성자
		// this를 안붙이면 그냥 셋 다 지역변수임
		this.id = id;
		this.name = name;
		this.address = address;
		this.password = password;
		this.product = product;
		this.review = review;
		this.email = email;
	}
	
}
