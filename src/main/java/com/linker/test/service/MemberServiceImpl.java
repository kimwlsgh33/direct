package com.linker.test.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.linker.test.controller.TestController;
import com.linker.test.dao.MemberDAO;
import com.linker.test.vo.MemberVO;

@Service	// 해당 클래스를 루트 컨테이너에 빈(Bean) 객체로 생성해주는 어노테이션.
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public List<MemberVO> selectMember() throws Exception {
		
		return memberDAO.selectMember();
	}

}