package com.linker.direct.user.service;

import com.linker.direct.user.vo.UserVO;
import com.linker.direct.user.vo.TermVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

// 회원정보 서비스
public interface UserService {

	// 로그인 처리
	public UserVO login(UserVO userVO) throws DataAccessException;
	
	// 회원가입 처리
	public int addMember(UserVO userVO) throws DataAccessException;
	
	// 회원 전체 목록 가져오기
	public List<UserVO> listMembers() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	// public MemberVO selectMember(String id) throws DataAccessException;
	public UserVO selectMember(UserVO userVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int modifyMember(UserVO userVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int memberAddress(UserVO userVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	//public int removeMember(String id) throws DataAccessException;
	public int removeMember(UserVO userVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(UserVO userVO) throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 가입 진행 후 약관 동의 정보 저장
	//------------------------------------------------------------------------------------------------
	public int addTerms(TermVO termVO) throws DataAccessException;
}
