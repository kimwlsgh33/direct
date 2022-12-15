package com.linker.direct.coupon.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.direct.coupon.dto.CouponDTO;
import com.linker.direct.coupon.dto.UserCouponDTO;
import com.linker.direct.coupon.service.CouponService;

@Controller
@RequestMapping("/coupon/*")
public class CouponController {

	@Inject
	CouponService couponService;
	
	// 쿠폰등록 할 수 있는 화면으로 가기(UserCouponDTO 정보)
	@RequestMapping("/coupon")
	public String userCoupon(Long user_id, Model model) throws Exception {
		// user_id 에 해당하는 user_id와 coupon_id를 model에 담는다.
		List<UserCouponDTO> coupon = couponService.userCoupon(user_id);
		System.out.println("내 쿠폰 : " + coupon);
		model.addAttribute("userCoupon", coupon);
		return "/coupon/coupon";
	}
	
	// 쿠폰 등록
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public int couponInsert(UserCouponDTO usercouponDTO) throws Exception {
		System.out.println("coupon_id => " + usercouponDTO);
		
		UserCouponDTO coupon = new UserCouponDTO();
		return couponService.couponInsert(coupon);
		
	}
	
	// 쿠폰 리스트(쿠폰아이디)
	@ResponseBody
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public List<CouponDTO> coupontList(Model model) throws Exception {
		//HttpSession session = request.getSession();
		//UserVO userVO = (UserVO) session.getAttribute("user");
		
		System.out.println("couponList");
		
		List<CouponDTO> couponList = couponService.couponList();
		model.addAttribute("list", couponList);
		
		System.out.println("couponList" + couponList);
		return couponList;
		
	}
	
}
