package com.linker.direct.member.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.linker.direct.member.service.MemberService;
import com.linker.direct.member.vo.MemberVO;
import com.linker.direct.member.vo.TermVO;

// 회원 정보 컨트롤러
@Controller("memberController")
@RequestMapping("/member")	// url에서 /member로 시작하는 요청을 처리하는 컨트롤러
public class MemberControllerImpl implements MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	// @Inject : Java에서 지원하는 어노테이션. 특정 Framework에 종속적이지 않다.
	// @Autowired : Spring에서 지원하는 어노테이션.
	
	@Autowired
	private MemberVO memberVO;
	
	// MemberService memberService = new MemberService();
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 처리
	@Override
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl login() 시작......");
		System.out.println("로그인 정보 => " + member.getId() + " : " + member.getPwd());
		
		ModelAndView mav = new ModelAndView();
		
		// 로그인한 정보를 가지고 데이터베이스에 존재하는지 처리를 하고 그 결과를 가져온다.
		memberVO = memberService.login(member);
		System.out.println("로그인 처리 결과 ==> " + memberVO);
		
		// 로그인한 정보가 데이터베이스에 존재하는지에 따라 처리를 달리 한다.
		
		if(memberVO != null) {	// 로그인 정보에 해당하는 자료가 있으면
			
			// 아이디와 비밀번호가 일치하면 세션을 발급한다.
			if(member.getPwd().equals(memberVO.getPwd())) {
				
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVO);
				session.setAttribute("isLogOn", true);
				//mav.setViewName("redirect/member/listMembers.do");
				//mav.setViewName("redirect:/main.do");	// 메인화면으로 이동
				mav.setViewName("redirect:/product/productList"); // productDTO정보 가져오기
				
			} else {	// 아이디는 있는데 비밀번호가 틀린 경우
				// 메세지를 가지고 로그인 화면으로 이동한다.
				
				rAttr.addAttribute("result", "PasswordFailed");
				mav.setViewName("/member/signIn");
				
			}
		} else {	// 로그인한 아이디가 존재하지 않으면 
			// 로그인 실패 메시지를 가지고 로그인 화면으로 이동한다.
			
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("/member/signIn");
		}
		
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 로그인 화면 띄우기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
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
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
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
	@RequestMapping(value = "/memberForm", method = RequestMethod.GET)
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/memberForm"); // 회원가입 화면으로 이동
		
		return mav;
	}
	
	//------------------------------------------------------------------------------------------------
	// 회원가입 화면으로 이동(명)
	//------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value = "/registerAjax_page", method = RequestMethod.GET)
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/registerAjax_page");	// 회원가입화면으로 이동
		
		return mav;
	} // End - 회원가입 이동

	// 회원가입 처리
	@Override
	@RequestMapping(value = "/addMember", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("memberVO") MemberVO memberVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl 회원가입 처리 시작......");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text.html;charset-UTF-8");
		
		int result = 0;
		// 사용자가 입력한 정보를 서비스에게 넘겨주어 처리하게 한다.
		result = memberService.addMember(memberVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("/member/terms");
		
		return mav;
	}

	// 회원 전체 목록 조회
	@Override
	@RequestMapping(value = "/listMembers", method=RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl 회원 전체 목록 조회 시작......");
		
		// 회원 전체 목록을 가져온다.
		List<MemberVO> memberLists = memberService.listMembers();
		
		ModelAndView mav = new ModelAndView("/member/listMembers");
		// ModelAndView mav = new ModelAndView("/product/productSelect");
		mav.addObject("memberLists", memberLists);
		
		return mav;
	}
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 조회
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="/updateMemberForm", method=RequestMethod.GET)
	public ModelAndView updateMemberForm(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 조회 user_id ==> " + user_id);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id(user_id);
		System.out.println("MemberController 회원 정보 조회 ==> " + memberVO);
		
		ModelAndView mav = new ModelAndView("/member/updateMemberForm");
		mav.addObject("member", memberService.selectMember(memberVO));
		
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
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	public ModelAndView modifyMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 수정하기 memberVO ==> " + memberVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = memberService.modifyMember(memberVO);

		ModelAndView mav = new ModelAndView("redirect:/member/listMembers");
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="memberAddress", method=RequestMethod.POST)
	public ModelAndView memberAddress(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 주소 수정하기 memberVO ==> " + memberVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = memberService.memberAddress(memberVO);

		ModelAndView mav = new ModelAndView("redirect:/member/listMembers");
		return mav;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	@RequestMapping(value="removeMember", method=RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id(user_id);
		
		int result = memberService.removeMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers");
		return mav;
	}

	//------------------------------------------------------------------------------------------------
		// 회원 가입 화면 불러오기 (AJAX)
		//------------------------------------------------------------------------------------------------
		@Override
		@RequestMapping(value = "/registerAjax", method = RequestMethod.GET)
		public String getRegisterAjaxForm() throws Exception {
			
			System.out.println("MemberController 회원 가입 화면 불러오기 (AJAX) ==> ");
			
			return "/member/registerAjax";
			
		} // End - 회원 가입 화면 불러오기 (AJAX)

		
		//------------------------------------------------------------------------------------------------
		// 아이디 중복 검사 (AJAX)
		//------------------------------------------------------------------------------------------------
		@Override
		@ResponseBody
		@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		public int idCheck(MemberVO memberVO) throws Exception {
			
			System.out.println("MemberController 아이디 중복 검사 (AJAX) ==> " + memberVO.getId());
			
//			int result = 1;
			int result = memberService.idCheck(memberVO);
			System.out.println("result : " + result);
			return result;
		}

		
		// 인증에 사용할 팝업창 열기
		@Override
		@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
		public ModelAndView emailConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			logger.info("emailConfirm 이메일 인증 시작.....");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/member/emailConfirm");
			
			return mav;
		}

		// 이메일 인증번호 보내기
		@Override
		@ResponseBody
		@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
		public String emailCheckGET(String email) throws Exception {
			
			logger.info("이메일 확인");
			logger.info("전송주소 : " + email);
			
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			logger.info("인증번호 : " + checkNum);
			
			// 이메일 발송
			String setFrom 	= "forourdirect2022@gmail.com";
			String toMail	= email;
			String title	= "회원가입 인증 메일입니다.";
			String content	= "인증번호는 " + checkNum + " 입니다." + "<br><br>" + "인증번호 입력창에 입력해주세요.";
			
			try {
				MimeMessage message			= mailSender.createMimeMessage();
				MimeMessageHelper helper	= new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(email);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			String num = Integer.toString(checkNum);
			
			return num;
			
		}

		// 가입 진행 후 약관 동의 정보 저장
		@RequestMapping(value = "/addTerms", method = RequestMethod.POST)
		@Override
		public ModelAndView addTerms(TermVO term, RedirectAttributes rAttr, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
			logger.info("MemberControllerImpl 약관 동의 정보 처리() 시작.....");
			
			int result = 0;
			result = memberService.addTerms(term);
			
			ModelAndView mav = new ModelAndView();
			rAttr.addFlashAttribute("result", result);
			mav.setViewName("/member/signIn");
			
			return mav;
		}

}
