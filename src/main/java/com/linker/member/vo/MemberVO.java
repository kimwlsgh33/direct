package com.linker.member.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component("memberVO")	// 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도 됨
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
@Data
public class MemberVO {	
	
	private Long user_id;	// 사용자 식별 아이디
	private String id;	// 사용자 아이디
	private String name;	// 사용자 이름
	private String zip_code;	//우편번호
	private String address;	// 사용자 주소
	private String address_detail;	// 상세주소
	private String pwd;	// 사용자 비밀번호 pwd로 수정
	private Timestamp created_at;	// 가입일자 created_at으로 수정
	private String email;	// 사용자 이메일
	private String phone;	// 사용자 연락처
	
	private int address_id;	// 대표주소 설정 시 mapper에서 이름만 사용
	
	// 나는 사용안하는데 일단 통일
	private String birthday;
	private int point;
	private Timestamp updated_at;
	private String status;
	//private	Role role;	// 권한
	//private Grade grade;	// 유저 등급
}
