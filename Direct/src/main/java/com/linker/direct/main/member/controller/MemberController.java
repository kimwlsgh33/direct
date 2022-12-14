package com.linker.direct.main.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.linker.direct.main.member.VO.MemberVO;

public interface MemberController {
	//------------------------------------------------------------------------------------------------
	// 로그인 화면으로 이동
	//------------------------------------------------------------------------------------------------
	public ModelAndView signIn(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 로그인 처리
	//------------------------------------------------------------------------------------------------
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//------------------------------------------------------------------------------------------------
	// 로그아웃 처리
	//------------------------------------------------------------------------------------------------
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//------------------------------------------------------------------------------------------------
	// 회원가입 화면으로 이동
	//------------------------------------------------------------------------------------------------
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 회원가입 처리
	//------------------------------------------------------------------------------------------------
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//------------------------------------------------------------------------------------------------
	// 가입 회원 정보 가져오기
	//------------------------------------------------------------------------------------------------
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//------------------------------------------------------------------------------------------------
	// 회원 정보 수정 화면으로 이동
	//------------------------------------------------------------------------------------------------
	public ModelAndView modifyForm(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView modifyMember(@ModelAttribute("info") MemberVO memberVO,
				HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	//------------------------------------------------------------------------------------------------
	// 회원 가입 화면 불러오기 (AJAX)
	//------------------------------------------------------------------------------------------------
	public String getRegisterAjaxForm() throws Exception;
	
	
	//------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//------------------------------------------------------------------------------------------------
	public int idCheck(MemberVO memberVO) throws Exception;
	
	
	// 인증에 사용할 팝업창 열기
	public ModelAndView emailConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 이메일 인증번호 보내기
	public String emailCheckGET(String email) throws Exception;
	
	// 가입 진행 후 약관 동의 정보 저장
	public ModelAndView addTerms()
	
	
}
