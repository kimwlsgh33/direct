package com.linker.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.linker.member.dao.MemberDAO;
import com.linker.member.vo.MemberVO;

// 회원정보 서비스
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDAO memberDAO;
	
	// 로그인 처리
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl login() 시작......");
		
		return memberDAO.loginByID(memberVO);
	}

	// 회원가입 처리
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + memberVO);
		return memberDAO.addMember(memberVO);
	}
	
	// 회원전체 목록 가져오기
	@Override
	public List<MemberVO> listMembers() throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원 전체목록 가져오기 시작......");
		List<MemberVO> memberLists = null;
		memberLists = memberDAO.selectAllMemberList();
		
		return memberLists;
	}
	

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MemberVO selectMember(String id) throws DataAccessException {
		MemberVO memberVO = memberDAO.selectMember(id);
		return memberVO;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int modifyMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		
		logger.info("MemberServiceImpl 아이디 중복 검사 시작.....");
		int result = memberDAO.idCheck(memberVO);
		
		return result;
	}

}
