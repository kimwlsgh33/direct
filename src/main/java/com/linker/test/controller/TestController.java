package com.linker.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.linker.test.service.MemberService;
import com.linker.test.vo.MemberVO;

@Controller // bean으로 등록될 대상임을 알려줘야함, controller역할
@RequestMapping(value="/test")
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Inject		// 주입
	private MemberService service;	// 보통 interface로 만듬
	
	@RequestMapping(value="/memberList", method = RequestMethod.GET)	// 요청을 받음
	public String memberList(Model model) throws Exception {
		logger.info("TestController memberList(Model model)......");
		
		List<MemberVO> memberList = service.selectMember();
		
		model.addAttribute("memberList", memberList);
		
		return "/test/memberList";
	}
	
}
