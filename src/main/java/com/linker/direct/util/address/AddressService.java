package com.linker.direct.util.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("addressService")
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(Long user_id) throws Exception {
		List<AddressDTO> addressDTO = addressDAO.addressList(user_id);
		return addressDTO;
	}
	
	// 주소 등록
	public int addressRegister(AddressDTO addressDTO) throws Exception {
		System.out.println("UtilController 주소 등록하기 => " + addressDTO);
		return addressDAO.addressRegister(addressDTO);
	}
	
	// 주소 삭제
	public int addressDelete(Long address_id) {
		System.out.println("UtilController  주소 삭제하기.....");
		return addressDAO.addressDelete(address_id);
	}
	
	// 주소 상세조회
	public AddressDTO addressDetail(Long address_id) throws Exception {
		return addressDAO.addressDetail(address_id);
	}

	// 주소 수정
	public int addressUpdate(AddressDTO addressDTO) {
		System.out.println("UtilController  주소 수정하기....." + addressDTO);
		return addressDAO.addressUpdate(addressDTO);
	}

}
