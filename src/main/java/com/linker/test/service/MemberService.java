package com.linker.test.service;

import java.util.List;

import com.linker.test.vo.MemberVO;

public interface MemberService {

	public List<MemberVO> selectMember() throws Exception;
	
}
