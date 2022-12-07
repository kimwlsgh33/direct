package com.linker.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.member.vo.MemberVO;

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
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int memberAddress(MemberVO memberVO) throws DataAccessException;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	//public int deleteMember(String id) throws DataAccessException;
	public int deleteMember(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(MemberVO memberVO) throws DataAccessException;
}
