package com.linker.direct.user.dao;

import com.linker.direct.user.vo.UserVO;
import com.linker.direct.user.vo.TermVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

// 회원정보 DAO
public interface UserDAO {

	// 로그인 처리
	public UserVO loginByID(UserVO userVO) throws DataAccessException;
	
	// 회원가입 처리
	public int addMember(UserVO userVO) throws DataAccessException;
	
	// 회원 전체목록 가져오기
	public List<UserVO> selectAllMemberList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	// public MemberVO selectMember(String id) throws DataAccessException;
	public UserVO selectMember(UserVO userVO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int updateMember(UserVO userVO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	//public int deleteMember(String id) throws DataAccessException;
	public int deleteMember(UserVO userVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(UserVO userVO) throws DataAccessException;
	
	// 가입 진행 후 약관 동의 정보 저장
	public int addTerms(TermVO termVO) throws DataAccessException;
}
