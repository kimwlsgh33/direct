package com.linker.direct.main.member.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.linker.direct.main.member.VO.MemberVO;

//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.direct.main.member";

	//------------------------------------------------------------------------------------------------
	// 로그인 처리
	//------------------------------------------------------------------------------------------------
	@Override
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 로그인 처리() 시작......" + memberVO);
		
		MemberVO memVO = sqlSession.selectOne(Namespace + ".loginByID", memberVO);
		
		return memVO;
	} // End - 로그인 처리

	//------------------------------------------------------------------------------------------------
	// 회원가입 처리
	// sqlSession.insert(사용할 mapper의 id, DB에 저장할 값
	//------------------------------------------------------------------------------------------------
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + memberVO);
		
		int result = sqlSession.insert(Namespace + ".addMember", memberVO);
		
		return result;
	} // End - 회원가입 처리

	
	//------------------------------------------------------------------------------------------------
	// 회원 전체 목록 가져오기
	//------------------------------------------------------------------------------------------------
	@Override
	public List<MemberVO> selectAllMemberList() throws DataAccessException {
		
		logger.info("MemberDAOImpl 회원 전체 목록 가져오기() 시작......");
		
		
		List<MemberVO> memberLists =null;
		memberLists = sqlSession.selectList(Namespace + ".selectAllMemberList");
		
		return memberLists;
		
	} // End - 회원 전체 목록 가져오기

	//------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정
	//------------------------------------------------------------------------------------------------
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberDAOImpl 회원 정보 수정() 시작......");
		
		int result = sqlSession.update(Namespace + ".updateMember", memberVO);
		
		return result;
	}

	//------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제
	//------------------------------------------------------------------------------------------------
	@Override
	public int removeMember(String id) throws DataAccessException {
		
		logger.info("MemberDAOImpl 회원 정보 삭제() 시작......");
		
		int result = sqlSession.delete(Namespace + ".removeMember", id);
		
		return result;
	}

	
	//------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberDAOImpl idCheck(MemberVO memberVO) id : " + memberVO.getId());
		
		return sqlSession.selectOne(Namespace + ".idCheck", memberVO);
	}


}
