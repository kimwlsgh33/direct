package com.linker.direct.util;

import com.linker.direct.util.address.AddressDTO;
import com.linker.direct.util.address.AddressService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/util")
public class UtilController {
	
	private static final Logger logger = LoggerFactory.getLogger(UtilController.class);
	
	@Inject
	private AddressService addressService;
	
	// 주소검색
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address() throws Exception {
		
		logger.info("UtilController 주소검색 화면으로 이동.....");
		
		return "/util/address";
	}
	
	// 아이디에 해당하는 주소지 리스트
	@RequestMapping(value = "/addressList", method = RequestMethod.GET)
	public ModelAndView addressList(@RequestParam("user_id") Long user_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("addressList user_id ==> " + user_id);
		
		// 수정을 요청한 user_id에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
		List<AddressDTO> addressList = addressService.addressList((long) Integer.parseInt((String)request.getParameter("user_id")));
		System.out.println("addressList 조회 ==> " + addressList);
		
		// 찾아온 데이터를 가지고 주소 리스트 화면으로 넘어간다.
		ModelAndView mav = new ModelAndView("/util/addressList");
		mav.addObject("address", addressList);
		
		return mav;
	}
	
	//==================================================================================================
	// 로그인 유저 주소지 목록 조회
	//==================================================================================================

	@ResponseBody
	@RequestMapping(value = "/addressList", method = RequestMethod.POST)
	public List<AddressDTO> addressList(@RequestParam("user_id") Long user_id) throws Exception {
		List<AddressDTO> addressList = addressService.addressList(user_id);
		System.out.println("addressList 조회 ==> " + addressList);
		return addressList;
	}
	
	// 주소지 등록 처리
	@ResponseBody	// 값만 받는다.
	@RequestMapping(value = "/addressRegister", method = RequestMethod.POST)
	public String addressRegister(AddressDTO addressDTO) throws Exception {
		
		System.out.println("UtilController 주소 등록 처리......");
		System.out.println("AddressDTO 값 : " + addressDTO);
		
		// address.js의 스크립트 참조
		if(addressService.addressRegister(addressDTO) == 1) {
			return "Y";	// 주소 등록 완료
		} else {
			return "N";	// 주소 등록 실패
		}
		
	}
	
	// 주소 고유 address_id에 해당하는 주소 삭제
	@ResponseBody
	@RequestMapping(value = "/addressDelete", method = RequestMethod.POST)
	public String addressDelete(Locale locale, Model model, HttpServletRequest request) throws Exception {
		System.out.println("UtilController addressDelete() address_id : " + request.getParameter("address_id"));

		if(addressService.addressDelete((long)Integer.parseInt((String)request.getParameter("address_id"))) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	// 주소 상세 조회
	@RequestMapping(value = "/addressDetail", method = RequestMethod.GET)
	public String addressDetail(Locale locale, Model model, HttpServletRequest request) throws Exception {
		System.out.println("UtilController addressDetail() address_id : " + Integer.parseInt((String)request.getParameter("address_id")));
		
		// address_id에 해당하는 주소 데이터를 가져온다.
		AddressDTO addressDTO = addressService.addressDetail((long)Integer.parseInt((String)request.getParameter("address_id")));
		model.addAttribute("detail", addressDTO);
		return "/util/addressDetail";
	}

	// 주소 수정화면
	@RequestMapping(value = "/addressUpdateForm", method = RequestMethod.POST)
	public String addressUpdateForm(Locale locale, Model model, HttpServletRequest request) throws Exception {
		
		logger.info("UtilController 주소 수정화면 불러오기.....");
		System.out.println("UtilController addressUpdateForm() address_id : " + request.getParameter("address_id"));

		AddressDTO addressDTO = addressService.addressDetail((long)Integer.parseInt((String)request.getParameter("address_id")));
		model.addAttribute("detail", addressDTO);
		logger.info("UtilController 주소 수정화면 끝.....");
		return "/util/addressUpdate";
	}
	
	// 주소 수정
	@ResponseBody
	@RequestMapping(value = "/addressUpdate", method = RequestMethod.POST)
	public String addressUpdate(Locale locale, Model model, AddressDTO addressDTO) throws Exception {
		System.out.println("UtilController addressUpdate() addressDTO : " + addressDTO);
		if(addressService.addressUpdate(addressDTO) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
}
