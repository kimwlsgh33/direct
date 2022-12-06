package com.linker.util.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linker.review.dto.ReviewDTO;

@Service("addressService")
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(String id) throws Exception {
		List<AddressDTO> addressDTO = addressDAO.addressList(id);
		return addressDTO;
	}
	
	// 주소 등록
	public int addressRegister(AddressDTO addressDTO) throws Exception {
		System.out.println("UtilController 주소 등록하기 => " + addressDTO);
		return addressDAO.addressRegister(addressDTO);
	}
	
	// 주소 삭제
	public int addressDelete(int addr_no) {
		System.out.println("UtilController  리뷰 삭제하기.....");
		return addressDAO.addressDelete(addr_no);
	}

}
