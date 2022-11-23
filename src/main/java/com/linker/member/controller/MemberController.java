package com.linker.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.linker.member.vo.MemberVO;

public interface MemberController {

	// 로그인 처리
	// model은 데이터만 넘어가는데 ModelAndView는 뷰도 같이 넘어감
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	// 로그아웃 처리
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원가입 폼
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원가입 처리
	public ModelAndView addMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	// 회원 전체 목록 조회
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 조회
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView updateMemberForm(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 상품정보 조회
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView productList(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView modifyMember(@ModelAttribute("info") MemberVO memberVO,
				HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원 가입 화면 불러오기 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public String getRegisterAjaxForm() throws Exception;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	public int idCheck(MemberVO memberVO) throws Exception;

}
