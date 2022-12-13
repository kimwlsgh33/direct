package com.linker.direct.user.controller;

import com.linker.direct.user.service.MemberService;
import com.linker.direct.user.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

// 회원 정보 컨트롤러
@Controller("memberController")
@RequestMapping("/member")	// url에서 /member로 시작하는 요청을 처리하는 컨트롤러
public class MemberControllerImpl implements MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	// @Inject : Java에서 지원하는 어노테이션. 특정 Framework에 종속적이지 않다.
	// @Autowired : Spring에서 지원하는 어노테이션.
	
	@Autowired
	private UserVO userVO;

	@Autowired
	private MemberService memberService;
	
	// 로그인 처리
	@Override
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") UserVO member, RedirectAttributes rAttr, HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl login() 시작......");
		System.out.println("로그인 정보 => " + member.getId() + " : " + member.getPwd());
		
		ModelAndView mav = new ModelAndView();
		
		// 로그인한 정보를 가지고 데이터베이스에 존재하는지 처리를 하고 그 결과를 가져온다.
		userVO = memberService.login(member);
		System.out.println("로그인 처리 결과 ==> " + userVO);
		
		// 로그인한 정보가 데이터베이스에 존재하는지에 따라 처리를 달리 한다.
		
		if(userVO != null) {	// 로그인 정보에 해당하는 자료가 있으면
			
			// 아이디와 비밀번호가 일치하면 세션을 발급한다.
			if(member.getPwd().equals(userVO.getPwd())) {
				
				HttpSession session = request.getSession();
				session.setAttribute("member", userVO);
				session.setAttribute("isLogOn", true);
				//mav.setViewName("redirect/member/listMembers.do");
				mav.setViewName("redirect:/product/productList"); // productDTO정보 가져오기
				
			} else {	// 아이디는 있는데 비밀번호가 틀린 경우
				// 메세지를 가지고 로그인 화면으로 이동한다.
				
				rAttr.addAttribute("result", "PasswordFailed");
				mav.setViewName("/member/loginForm");
				
			}
		} else {	// 로그인한 아이디가 존재하지 않으면 
			// 로그인 실패 메시지를 가지고 로그인 화면으로 이동한다.
			
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 로그인 화면 띄우기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

	   logger.info("========================================================================================");
	   logger.info("MemberControllerImpl loginForm() 시작.....");
	   logger.info("========================================================================================");

	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("/member/loginForm");
	   return mav;
	      
	}
	
	// 로그아웃 처리
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		
		ModelAndView mav = new ModelAndView();
		// mav.setViewName("redirect:/main.do"); // 메인화면으로 이동
		mav.setViewName("redirect:/product/productList");
		return mav;
	}

	// 회원가입 폼
	@Override
	@RequestMapping(value = "/memberForm.do", method = RequestMethod.GET)
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberForm"); // 회원가입 화면으로 이동
		
		return mav;
	}

	// 회원가입 처리
	@Override
	@RequestMapping(value = "/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("memberVO") UserVO userVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl 회원가입 처리 시작......");
		
		request.setCharacterEncoding("UTF-8");
		// response.setContentType("text.html;charset-UTF-8");
		
		int result = 0;
		// 사용자가 입력한 정보를 서비스에게 넘겨주어 처리하게 한다.
		result = memberService.addMember(userVO);
		
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		return mav;
	}

	// 회원 전체 목록 조회
	@Override
	@RequestMapping(value = "/listMembers.do", method=RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl 회원 전체 목록 조회 시작......");
		
		// 회원 전체 목록을 가져온다.
		List<UserVO> memberLists = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView("/member/listMembers");
		// ModelAndView mav = new ModelAndView("/product/productSelect");
		mav.addObject("memberLists", memberLists);
		
		return mav;
	}
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 조회
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/updateMemberForm.do", method=RequestMethod.GET)
	public ModelAndView updateMemberForm(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 조회 user_id ==> " + user_id);
		
		UserVO userVO = new UserVO();
		userVO.setUser_id(user_id);
		System.out.println("MemberController 회원 정보 조회 ==> " + userVO);
		
		ModelAndView mav = new ModelAndView("/member/updateMemberForm");
		mav.addObject("member", memberService.selectMember(userVO));
		
		return mav;
		
		/*
		// 회원 전체 리스트 화면에서 수정을 요청한 id에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
		memberVO = memberService.selectMember(id);
		System.out.println("MemberController 회원 정보 조회 ==> " + memberVO);
		
		// 찾아온 데이터를 가지고 개인 정보 수정화면으로 넘어간다.
		ModelAndView mav = new ModelAndView("/member/updateMemberForm");
		mav.addObject("member", memberVO);
		
		return mav;
		*/
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="modifyMember.do", method=RequestMethod.POST)
	public ModelAndView modifyMember(@ModelAttribute("memberVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 수정하기 memberVO ==> " + userVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = memberService.modifyMember(userVO);

		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="memberAddress", method=RequestMethod.POST)
	public ModelAndView memberAddress(@ModelAttribute("memberVO") UserVO userVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 주소 수정하기 memberVO ==> " + userVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = memberService.memberAddress(userVO);

		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="removeMember.do", method=RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		UserVO userVO = new UserVO();
		userVO.setUser_id(user_id);
		
		int result = memberService.removeMember(userVO);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 회원가입 화면 불러오기(AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/registerAjaxForm.do", method=RequestMethod.GET)
	public String getRegisterAjaxForm() throws Exception {
		
		System.out.println("MemberController 회원가입 화면 불러오기 (AJAX) ==> ");
		
		return "/member/registerAjax";
	}
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사 (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@ResponseBody	// json형태의 값을 보낼 때 사용
	@Override
	@RequestMapping(value="/idCheck", method = RequestMethod.POST)
	public int idCheck(UserVO userVO) throws Exception {
		
		System.out.println("MemberController 아이디 중복 검사 (AJAX) id ==> " + userVO.getId());
		
		// int result=1;
		int result = memberService.idCheck(userVO);
		System.out.println("result : " + result);
		return result;
	}


}
