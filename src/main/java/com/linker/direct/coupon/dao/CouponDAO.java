package com.linker.direct.coupon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.linker.direct.coupon.dto.CouponDTO;
import com.linker.direct.coupon.dto.UserCouponDTO;


@Repository
public class CouponDAO {

	@Inject
	SqlSession sqlSession;
	
	private static String NAMESPACE = "coupon";
	
	// 쿠폰등록 할 수 있는 화면으로 가기(UserCouponDTO)
	public List<UserCouponDTO> userCoupon(Long user_id) throws Exception {
		System.out.println("userCoupon => " + user_id);
		return sqlSession.selectList(NAMESPACE + ".userCoupon", user_id);
	}
	
	// 쿠폰 등록
	public int couponInsert(UserCouponDTO usercouponDTO) throws Exception {
		System.out.println("couponInsert => " + usercouponDTO);
		return sqlSession.insert(NAMESPACE + ".couponInsert", usercouponDTO);
	}
	
	// 쿠폰 리스트
	public List<CouponDTO> couponList() throws Exception {
		System.out.println("couponList ");
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	//=======================================================
	// 쿠폰 생성
	//=======================================================

	public void create(CouponDTO couponDTO) throws Exception {
		System.out.println("create => " + couponDTO);
		sqlSession.insert(NAMESPACE + ".create", couponDTO);
	}

	public List<CouponDTO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	public CouponDTO read(Long coupon_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".read", coupon_id);
	}

	public void update(CouponDTO couponDTO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", couponDTO);
	}

	public void delete(Long coupon_id) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", coupon_id);
	}
	
}
