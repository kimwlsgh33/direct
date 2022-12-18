package com.linker.direct.util.address;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class AddressDTO {
// address_id, user_id, id, receiver, phone, address, address_detail, zip_code, created_at, updated_at, status
	private Long address_id;	// 주소 고유 번호(PK)
	private Long user_id;	// 사용자 고유 id(외래키)
	private String id;	// 사용자 정보(외래키) 수정 후 삭제 ㄱㄱ
	private String receiver;	// 받는사람 이름
	private String phone;	// 받는사람 번호
	private String address;	// 사용자 주소
	private String address_detail;
	private String zip_code;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String status;
	
}