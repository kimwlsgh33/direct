package com.linker.direct.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.linker.direct.member.service.MemberServiceImpl;
import com.linker.direct.member.vo.MemberVO;
import com.linker.direct.member.vo.TermVO;

// 회원정보 DAO
@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.direct.member";
	
	// 로그인 처리
	@Override
	public MemberVO loginByID(MemberVO memberVO) throws DataAccessException {
		
		MemberVO memVO = sqlSession.selectOne(Namespace + ".loginByID", memberVO);	// 한 건일 때
		
		return memVO;
	}

	// 회원가입 처리
	// sqlSession.insert(사용할 mapper의 id, DB에 저장할 값) => 데이터를 db에 저장할 수 있음
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원가입 처리() 시작......" + memberVO);
		
		int result = sqlSession.insert(Namespace + ".addMember", memberVO);
		return result;
	}

	// 회원 전체목록 가져오기
	@Override
	public List<MemberVO> selectAllMemberList() throws DataAccessException {
		
		logger.info("MemberServiceImpl 회원 전체목록 가져오기 시작......");
		
		List<MemberVO> memberLists = null;
		memberLists = sqlSession.selectList(Namespace + ".selectAllMemberList" );
		return memberLists;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	// public MemberVO selectMember(String id) throws DataAccessException {
	public MemberVO selectMember(MemberVO memberVO) throws DataAccessException {
		MemberVO memVO = sqlSession.selectOne(Namespace + ".selectMember", memberVO);
		return memVO;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update(Namespace + ".updateMember", memberVO);
		return result;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	//public int deleteMember(String id) throws DataAccessException {
	public int deleteMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.delete(Namespace + ".deleteMember", memberVO);
		return result;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberVO memberVO) throws DataAccessException {
		
		logger.info("MemberDAOImpl idCheck(MemberVO memberVO) id : " + memberVO.getId());
		return sqlSession.selectOne(Namespace + ".idCheck", memberVO);
	}

	// 가입 진행 후 약관 동의 정보 저장
	@Override
	public int addTerms(TermVO termVO) throws DataAccessException {
		
		logger.info("MemberServiceImpl 약관 동의 정보 처리() 시작......" + termVO);
		
		int result = sqlSession.insert(Namespace + ".addTerms", termVO);
		
		return result;
	}


}
