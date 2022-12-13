package com.linker.direct.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.direct.member.vo.MemberVO;
import com.linker.direct.member.vo.TermVO;

// 회원정보 DAO
public interface MemberDAO {

	// 로그인 처리
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException;
	
	// 회원가입 처리
	public int addMember(MemberVO memberVO) throws DataAccessException;
	
	// 회원 전체목록 가져오기
	public List<MemberVO> selectAllMemberList() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	// public MemberVO selectMember(String id) throws DataAccessException;
	public MemberVO selectMember(MemberVO memberVO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int updateMember(MemberVO memberVO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	//public int deleteMember(String id) throws DataAccessException;
	public int deleteMember(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(MemberVO memberVO) throws DataAccessException;
	
	// 가입 진행 후 약관 동의 정보 저장
	public int addTerms(TermVO termVO) throws DataAccessException;
}
