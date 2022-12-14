package com.linker.direct.util.address;

import com.linker.direct.user.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.linker.direct.util";
	
	// 아이디에 해당하는 주소지 리스트
	public List<AddressDTO> addressList(Long user_id) throws DataAccessException {
		List<AddressDTO> addressDTO = sqlSession.selectList(namespace + ".addressList", user_id);
		return addressDTO;
	}
	
	// 주소 등록 처리
	public int addressRegister(AddressDTO addressDTO) throws DataAccessException {
		System.out.println("UtilController 주소 등록 처리 => " + addressDTO);
		return sqlSession.insert(namespace + ".insertAddress", addressDTO);
	}
	
	// 주소 삭제
	public int addressDelete(Long address_id) throws DataAccessException {
		System.out.println("UtilController  주소 삭제하기.....");
		return sqlSession.delete(namespace + ".delete", address_id);
	}

	// 주소 상세조회
	public AddressDTO addressDetail(Long address_id) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".detail", address_id);
	}
	
	// 주소 수정
	public int addressUpdate(AddressDTO addressDTO) throws DataAccessException {
		System.out.println("UtilController  주소 수정하기....." + addressDTO);
		return sqlSession.update(namespace + ".update", addressDTO);
	}

	// 아이디에 해당하는 회원 주소만 수정하기(memberService에 연결되어있음)
	public int memberAddress(UserVO userVO) throws DataAccessException {
		return sqlSession.update(namespace + ".updateAddress", userVO);
	}

}
