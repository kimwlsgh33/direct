package com.linker.util.address;

import lombok.Data;

@Data
public class AddressDTO {

	private int addr_no;	// 주소 고유 번호(PK)
	private String id;	// 사용자 정보(외래키)
	private String address;	// 사용자 주소
	private String addr_name;	// 받는사람 이름
	private String addr_number;	// 받는사람 번호
	
}
