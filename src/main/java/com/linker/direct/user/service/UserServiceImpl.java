package com.linker.direct.user.service;

import com.linker.direct.user.dao.UserDAO;
import com.linker.direct.user.vo.UserVO;
import com.linker.direct.user.vo.TermVO;
import com.linker.direct.util.address.AddressDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

// 회원정보 서비스
@Service("memberService")
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private UserDAO userDAO;
	
	
	@Autowired
	private AddressDAO addressDAO;
	
	
	// 로그인 처리
	@Override
	public UserVO login(UserVO userVO) throws DataAccessException {
		return userDAO.loginByID(userVO);
	}

	// 회원가입 처리
	@Override
	public int addMember(UserVO userVO) throws DataAccessException {
		return userDAO.addMember(userVO);
	}
	
	// 회원전체 목록 가져오기
	@Override
	public List<UserVO> listMembers() throws DataAccessException {
		List<UserVO> memberLists = null;
		memberLists = userDAO.selectAllMemberList();
		
		return memberLists;
	}
	

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	// public MemberVO selectMember(String id) throws DataAccessException {
		public UserVO selectMember(UserVO userVO) throws DataAccessException {
		//MemberVO memberVO = memberDAO.selectMember(memberVO);
		return userDAO.selectMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int modifyMember(UserVO userVO) throws DataAccessException {
		return userDAO.updateMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int memberAddress(UserVO userVO) throws DataAccessException {
		return addressDAO.memberAddress(userVO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int removeMember(UserVO userVO) throws DataAccessException {
		return userDAO.deleteMember(userVO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(UserVO userVO) throws Exception {
		
		logger.info("MemberServiceImpl 아이디 중복 검사 시작.....");
		int result = userDAO.idCheck(userVO);
		
		return result;
	}

	// 가입 진행 후 약관 동의 정보 저장
	@Override
	public int addTerms(TermVO termVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + termVO);
		
		return userDAO.addTerms(termVO);
		
	}


}
