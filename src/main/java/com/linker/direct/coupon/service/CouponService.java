package com.linker.direct.coupon.service;

import com.linker.direct.coupon.dao.CouponDAO;
import com.linker.direct.coupon.dto.CouponDTO;
import com.linker.direct.coupon.dto.UserCouponDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CouponService {
	
	@Inject
	CouponDAO couponDAO;
	
	// 쿠폰등록 할 수 있는 화면으로 가기(UserCouponDTO 정보가져오기)
	public List<UserCouponDTO> userCoupon(Long user_id) throws Exception {
		return couponDAO.userCoupon(user_id);
	}
	
	// 쿠폰 등록
	public int couponInsert(UserCouponDTO usercouponDTO) throws Exception {
		return couponDAO.couponInsert(usercouponDTO);
	}
	
	// 쿠폰 리스트
	public List<CouponDTO> couponList() throws Exception {
		return couponDAO.couponList();
	}
	
}
