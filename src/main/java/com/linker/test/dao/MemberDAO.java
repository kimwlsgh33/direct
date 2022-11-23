package com.linker.test.dao;

import java.util.List;

import com.linker.test.vo.MemberVO;

public interface MemberDAO {
	
	public List<MemberVO> selectMember() throws Exception;
	
}