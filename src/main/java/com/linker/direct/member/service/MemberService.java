package com.linker.direct.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.direct.member.vo.MemberVO;
import com.linker.direct.member.vo.TermVO;

// 회원정보 서비스
public interface MemberService {

	// 로그인 처리
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	
	// 회원가입 처리
	public int addMember(MemberVO memberVO) throws DataAccessException;
	
	// 회원 전체 목록 가져오기
	public List<MemberVO> listMembers() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	// public MemberVO selectMember(String id) throws DataAccessException;
	public MemberVO selectMember(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int modifyMember(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int memberAddress(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	//public int removeMember(String id) throws DataAccessException;
	public int removeMember(MemberVO memberVO) throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(MemberVO memberVO) throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 가입 진행 후 약관 동의 정보 저장
	//------------------------------------------------------------------------------------------------
	public int addTerms(TermVO termVO) throws DataAccessException;
}
