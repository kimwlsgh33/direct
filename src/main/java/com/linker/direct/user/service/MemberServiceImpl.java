package com.linker.direct.user.service;
import com.linker.direct.user.dao.MemberDAO;
import com.linker.direct.user.vo.UserVO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

// 회원정보 서비스
@RequiredArgsConstructor
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	private MemberDAO memberDAO;
	
	
	// private AddressDAO addressDAO;
	
	
	// 로그인 처리
	@Override
	public UserVO login(UserVO userVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl login() 시작......");
		
		return memberDAO.loginByID(userVO);
	}

	// 회원가입 처리
	@Override
	public int addMember(UserVO userVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + userVO);
		return memberDAO.addMember(userVO);
	}
	
	// 회원전체 목록 가져오기
	@Override
	public List<UserVO> listMembers() throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원 전체목록 가져오기 시작......");
		List<UserVO> memberLists = null;
		memberLists = memberDAO.selectAllMemberList();
		
		return memberLists;
	}
	

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	// public MemberVO selectMember(String id) throws DataAccessException {
		public UserVO selectMember(UserVO userVO) throws DataAccessException {
		//MemberVO memberVO = memberDAO.selectMember(memberVO);
		return memberDAO.selectMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int modifyMember(UserVO userVO) throws DataAccessException {
		return memberDAO.updateMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public int memberAddress(UserVO userVO) throws DataAccessException {
		
		try {
			// return addressDAO.memberAddress(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int removeMember(UserVO userVO) throws DataAccessException {
		return memberDAO.deleteMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(UserVO userVO) throws Exception {
		
		logger.info("MemberServiceImpl 아이디 중복 검사 시작.....");
		int result = memberDAO.idCheck(userVO);
		
		return result;
	}


}
