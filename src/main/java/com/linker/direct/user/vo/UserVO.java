package com.linker.direct.user.vo;

import com.linker.direct.user.constant.Grade;
import com.linker.direct.user.constant.Role;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component("memberVO")	// 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도 됨
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
@Data
public class UserVO {
	
	private Long user_id;	// 사용자 식별 아이디
	private String id;	// 사용자 아이디
	private String name;	// 사용자 이름
	private String pwd;	// 사용자 비밀번호 pwd로 수정
	private String email;	// 사용자 이메일
	private String phone;	// 사용자 연락처
	private String address;	// 사용자 주소
	private String address_detail;	// 상세주소
	private String zip_code;	//우편번호
	private String birthday;
	private int point;
	private Timestamp created_at;	// 가입일자 created_at으로 수정
	private Timestamp updated_at;
	private Long address_id;	// 대표주소 설정 시 mapper에서 이름만 사용
	private String status;
	private Role role;	// 권한
	private Grade grade;	// 유저 등급
    private String terms_status; // 약관 동의 상태
}
