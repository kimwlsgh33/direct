package com.linker.member.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("memberVO")	// 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도 됨
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
@Data
public class MemberVO {	
	
	private int user_id;	// 사용자 식별 아이디
	private String id;	// 사용자 아이디
	private String name;	// 사용자 이름
	private String zip_code;	//우편번호
	private String address;	// 사용자 주소
	private String address_detail;	// 상세주소
	private String password;	// 사용자 비밀번호
	private Timestamp joinDate;	// 가입일자
	private String email;	// 사용자 이메일
	private String number;	// 사용자 연락처
	
	private String address_id;

	public MemberVO() {}	// 기본 생성자
	public MemberVO(String id, String name, String address, String password, String email, String number) {	// 매개변수 있는 생성자
		// this를 안붙이면 그냥 셋 다 지역변수임
		this.id = id;
		this.name = name;
		this.address = address;
		this.password = password;
		this.email = email;
		this.number = number;
	}
	
}
