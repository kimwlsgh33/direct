package com.linker.util.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.util";
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(String id) throws Exception {
		List<AddressDTO> addressDTO = sqlSession.selectList(Namespace + ".addressList", id);
		return addressDTO;
	}

}
