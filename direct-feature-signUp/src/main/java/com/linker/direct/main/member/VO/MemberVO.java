package com.linker.direct.main.member.VO;



import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

// import com.linker.direct.user.constant.Grade; 추가해야할 작업물1
// import com.linker.direct.user.constant.Role;         -         2

//------------------------------------------------------------------------------------------
// 회원 정보
// @Component 어노테이션을 이용하면 Bean Configuration 파일에 Bean으로 따로 등록하지 않아도
//	          사용할 수 있다.
// @Component 어노테이션은 기본적으로 타입기반의 자동주입 어노테이션이다.
//------------------------------------------------------------------------------------------
@Component("memberVO")
@Data
public class MemberVO {
	
	private long		user_id;		// 구분자
	private String		id;				// 사용자 아이디
	private String		pwd;			// 비밀번호
	private String		name;			// 이름
	private String		email;			// 이메일
	private String		phone;			// 휴대폰 번호
	private String		birthday;		// 생일
	private String		zip_code;		// 우편번호
	private String		address;		// 주소
	private String		address_detail;	// 상세주소
	private int			point;			// 포인트
	private Timestamp	created_at;		// 가입일자
	private Timestamp	updated_at;		// 수정일자
//    private	Role 		role;			// 권한
//	private	Grade 		grade;			// 유저 등급
	private	String		status;			// 유저 상태
	private String		terms_status;	// 약관 동의 상태
	
} // End - public class MemberVO
