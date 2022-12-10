package com.linker.util.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.linker.member.vo.MemberVO;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.linker.util";
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(int user_id) throws Exception {
		List<AddressDTO> addressDTO = sqlSession.selectList(namespace + ".addressList", user_id);
		return addressDTO;
	}
	
	// 주소 등록 처리
	public int addressRegister(AddressDTO addressDTO) {
		System.out.println("UtilController 주소 등록 처리 => " + addressDTO);
		return sqlSession.insert(namespace + ".insertAddress", addressDTO);
	}
	
	// 주소 삭제
	public int addressDelete(int address_id) {
		System.out.println("UtilController  주소 삭제하기.....");
		return sqlSession.delete(namespace + ".delete", address_id);
	}

	// 주소 상세조회
	public AddressDTO addressDetail(int address_id) {
		return sqlSession.selectOne(namespace + ".detail", address_id);
	}
	
	// 주소 수정
	public int addressUpdate(AddressDTO addressDTO) {
		System.out.println("UtilController  주소 수정하기....." + addressDTO);
		return sqlSession.update(namespace + ".update", addressDTO);
	}

	// 아이디에 해당하는 회원 주소만 수정하기(memberService에 연결되어있음)
	public int memberAddress(MemberVO memberVO) throws Exception {
		return sqlSession.update(namespace + ".updateAddress", memberVO);
	}

}
