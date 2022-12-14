package com.linker.direct.main.member.VO;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

//------------------------------------------------------------------------------------------
// 회원 정보
// @Component 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도
//	          사용할 수 있다.
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
//------------------------------------------------------------------------------------------
@Component("memberVO")
@Data
public class MemberVO {
	
	private String		id;				// 사용자 아이디
	private String		pwd;			// 비밀번호
	private String		name;			// 이름
	private String		email;			// 이메일
	private String		phoneNumber;	// 휴대폰 번호
	private String		birthday;		// 생일
	private String		zipcode;		// 우편번호
	private String		address01;		// 주소
	private String		address02;		// 상세주소
	private String		point;			// 포인트
	private Date		joinDate;		// 가입일자
	
	public MemberVO() {}		// 기본생성자
	public MemberVO(String id, String pwd, String name, String email, String phoneNumber, String birthday, String address, String zipcode, String address01, String address02) {
		this.id				= id;
		this.pwd			= pwd;
		this.name			= name;
		this.email			= email;
		this.phoneNumber	= phoneNumber;
		this.birthday		= birthday;
		this.zipcode		= zipcode;
		this.address01		= address01;
		this.address02		= address02;
	}

} // End - public class MemberVO
