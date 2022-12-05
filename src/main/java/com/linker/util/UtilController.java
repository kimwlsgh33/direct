package com.linker.util;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.linker.util.address.AddressDTO;
import com.linker.util.address.AddressService;

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
	public ModelAndView addressList(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("addressList id ==> " + id);
		
		// 회원 전체 리스트 화면에서 수정을 요청한 id에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
		List<AddressDTO> addressList = addressService.addressList(id);
		System.out.println("addressList 조회 ==> " + addressList);
		
		// 찾아온 데이터를 가지고 개인 정보 수정화면으로 넘어간다.
		ModelAndView mav = new ModelAndView("/util/addressList");
		mav.addObject("address", addressList);
		
		return mav;
	}
}
