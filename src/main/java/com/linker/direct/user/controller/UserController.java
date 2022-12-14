package com.linker.direct.user.controller;

import com.linker.direct.user.service.UserService;
import com.linker.direct.user.vo.UserVO;
import com.linker.direct.user.vo.TermVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

// 회원 정보 컨트롤러
@Controller
@RequestMapping("/user")	// url에서 /member로 시작하는 요청을 처리하는 컨트롤러
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// @Inject : Java에서 지원하는 어노테이션. 특정 Framework에 종속적이지 않다.
	// @Autowired : Spring에서 지원하는 어노테이션.
	
	@Autowired
	private UserVO userVO;
	
	// MemberService memberService = new MemberService();
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 화면
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public ModelAndView signIn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/signIn");
		return mav;
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") UserVO user, RedirectAttributes rAttr, HttpServletRequest request,
							  HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		// 로그인한 정보를 가지도 데이터베이스에 존재하는지 처리를 하고 그 결과를 가져온다.
		UserVO userVO = userService.login(user);

		// 로그인한 정보가 데이터베이스에 존재하는지에 따라 처리를 다르게 한다.
		if(userVO != null) {   // 로그인 정보에 해당하는 자료가 있으면
			// 아이디와 비밀번호가 일치하면 세션을 발급한다.
			if(user.getPwd().equals(userVO.getPwd())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", userVO);
				session.setAttribute("isLogOn", true);
				mav.setViewName("redirect:/");   // 메인화면으로 이동

			} else {         // 아이디는 맞는데 비밀번호가 틀린경우
				// 메시지를 가지고 로그인 화면으로 이동한다.
				rAttr.addAttribute("result", "PasswordFailed");
				logger.info("PasswordFailed");
				mav.setViewName("redirect:/user/signIn");
			}

		} else {            // 로그인한 아이디가 존재하지 않으면
			// 로그인 실패 메시지를 가지고 로그인 화면으로 이동한다.
			rAttr.addAttribute("result", "loginFailed");
			logger.info("loginFailed");
			mav.setViewName("redirect:/user/signIn");
		}


		return mav;
	}

	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("isLogOn");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/"); // 메인화면으로 이동
		return mav;
	}
	
	//------------------------------------------------------------------------------------------------
	// 회원가입 화면으로 이동(명)
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/registerAjax_page", method = RequestMethod.GET)
	public ModelAndView signUp(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/registerAjax_page");	// 회원가입화면으로 이동
		
		return mav;
	} // End - 회원가입 이동

	// 회원가입 처리
	@RequestMapping(value = "/addMember", method=RequestMethod.POST)
	public ModelAndView addMember(UserVO userVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text.html;charset-UTF-8");
		
		int result = 0;
		// 사용자가 입력한 정보를 서비스에게 넘겨주어 처리하게 한다.
		result = userService.addMember(userVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("/user/terms");
		
		return mav;
	}

	//================================================================================================
	// 내 정보
	//================================================================================================

	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("user");
		ModelAndView mav = new ModelAndView("/user/myInfo");
		mav.addObject("user", userVO);
		return mav;
	}

	//================================================================================================
	// 회원 전체 목록 조회 ( test )
	//================================================================================================
	@RequestMapping(value = "/listMembers", method=RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("MemberControllerImpl 회원 전체 목록 조회 시작......");
		
		// 회원 전체 목록을 가져온다.
		List<UserVO> memberLists = userService.listMembers();
		
		ModelAndView mav = new ModelAndView("/user/listMembers");
		// ModelAndView mav = new ModelAndView("/product/productSelect");
		mav.addObject("memberLists", memberLists);
		
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 조회
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/updateMemberForm", method=RequestMethod.GET)
	public ModelAndView updateMemberForm(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUser_id(user_id);
		ModelAndView mav = new ModelAndView("/user/updateMemberForm");
		mav.addObject("member", userService.selectMember(userVO));
		
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
	@RequestMapping(value="modifyMember", method=RequestMethod.POST)
	public ModelAndView modifyMember(UserVO userVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 정보 수정하기 memberVO ==> " + userVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = userService.modifyMember(userVO);

		ModelAndView mav = new ModelAndView("redirect:/user/listMembers");
		return mav;
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 주소만 수정하기
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="memberAddress", method=RequestMethod.POST)
	public ModelAndView memberAddress(UserVO userVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MemberController 회원 주소 수정하기 memberVO ==> " + userVO);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int result = userService.memberAddress(userVO);

		ModelAndView mav = new ModelAndView("redirect:/user/listMembers");
		return mav;
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 회원 정보 삭제하기
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="removeMember", method=RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		UserVO userVO = new UserVO();
		userVO.setUser_id(user_id);
		
		int result = userService.removeMember(userVO);
		ModelAndView mav = new ModelAndView("redirect:/user/listMembers");
		return mav;
	}

	//------------------------------------------------------------------------------------------------
		// 회원 가입 화면 불러오기 (AJAX)
		//------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/registerAjax", method = RequestMethod.GET)
		public String getRegisterAjaxForm() throws Exception {
			
			System.out.println("MemberController 회원 가입 화면 불러오기 (AJAX) ==> ");
			
			return "/user/registerAjax";
			
		} // End - 회원 가입 화면 불러오기 (AJAX)

		
		//------------------------------------------------------------------------------------------------
		// 아이디 중복 검사 (AJAX)
		//------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
		public int idCheck(UserVO userVO) throws Exception {
			int result = userService.idCheck(userVO);
			return result;
		}

		// 이메일 인증번호 보내기
		@ResponseBody
		@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
		public String emailCheckGET(String email) throws Exception {
			
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

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
		public ModelAndView addTerms(TermVO term, RedirectAttributes rAttr, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			
			logger.info("MemberControllerImpl 약관 동의 정보 처리() 시작.....");
			
			int result = 0;
			result = userService.addTerms(term);
			
			ModelAndView mav = new ModelAndView();
			rAttr.addFlashAttribute("result", result);
			mav.setViewName("/user/signIn");
			
			return mav;
		}
}
