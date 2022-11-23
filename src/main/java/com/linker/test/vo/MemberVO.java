package com.linker.test.vo;

import lombok.Data;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

//@Getter
//@Setter
//@ToString	// 이 세개 쓰는것도 귀찮으면 @Data 만 써도 됨

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String name;
	
}

