package com.linker.direct.user.dao;
import com.linker.direct.user.service.MemberServiceImpl;
import com.linker.direct.user.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

// 회원정보 DAO
@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.member";
	
	// 로그인 처리
	@Override
	public UserVO loginByID(UserVO userVO) throws DataAccessException {
		
		UserVO memVO = sqlSession.selectOne(Namespace + ".loginByID", userVO);	// 한 건일 때
		
		return memVO;
	}

	// 회원가입 처리
	// sqlSession.insert(사용할 mapper의 id, DB에 저장할 값) => 데이터를 db에 저장할 수 있음
	@Override
	public int addMember(UserVO userVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + userVO);
		
		int result = sqlSession.insert(Namespace + ".addMember", userVO);
		return result;
	}

	// 회원 전체목록 가져오기
	@Override
	public List<UserVO> selectAllMemberList() throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원 전체목록 가져오기 시작......");
		
		List<UserVO> memberLists = null;
		memberLists = sqlSession.selectList(Namespace + ".selectAllMemberList" );
		return memberLists;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	// public MemberVO selectMember(String id) throws DataAccessException {
	public UserVO selectMember(UserVO userVO) throws DataAccessException {
		UserVO memVO = sqlSession.selectOne(Namespace + ".selectMember", userVO);
		return memVO;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int updateMember(UserVO userVO) throws DataAccessException {
		int result = sqlSession.update(Namespace + ".updateMember", userVO);
		return result;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	//public int deleteMember(String id) throws DataAccessException {
	public int deleteMember(UserVO userVO) throws DataAccessException {
		int result = sqlSession.delete(Namespace + ".deleteMember", userVO);
		return result;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(UserVO userVO) throws DataAccessException {
		
		logger.info("MemberDAOImpl idCheck(MemberVO memberVO) id : " + userVO.getId());
		return sqlSession.selectOne(Namespace + ".idCheck", userVO);
	}


}
