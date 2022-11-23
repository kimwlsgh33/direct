package com.linker.test.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.linker.test.controller.TestController;
import com.linker.test.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.test.mapper.memberMapper";

	@Override
	public List<MemberVO> selectMember() throws Exception {
		
		return sqlSession.selectList(Namespace + ".selectMember");
	}

}
