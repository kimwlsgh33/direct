package com.linker.util.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.linker.review.dto.ReviewDTO;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.linker.util";
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(String id) throws Exception {
		List<AddressDTO> addressDTO = sqlSession.selectList(namespace + ".addressList", id);
		return addressDTO;
	}
	
	// 주소 등록 처리
	public int addressRegister(AddressDTO addressDTO) {
		System.out.println("UtilController 주소 등록 처리 => " + addressDTO);
		return sqlSession.insert(namespace + ".insertAddress", addressDTO);
	}
	
	// 주소 삭제
	public int addressDelete(int addr_no) {
		System.out.println("UtilController  주소 삭제하기.....");
		return sqlSession.delete(namespace + ".delete", addr_no);
	}

}
