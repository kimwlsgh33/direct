package com.linker.util.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("addressService")
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(String id) throws Exception {
		List<AddressDTO> addressDTO = addressDAO.addressList(id);
		return addressDTO;
	}

}
