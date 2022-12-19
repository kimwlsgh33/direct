package com.linker.direct.review.service;

import com.linker.direct.review.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {
	
	// 리뷰 등록 처리
	public int reviewRegister(ReviewDTO reviewDTO) throws Exception;
	
	// 리뷰 목록 가져오기
	public List<ReviewDTO> reviewList() throws Exception;
	
	// 리뷰 상세조회
	public ReviewDTO reviewDetail(int review_no) throws Exception;
	
	// 리뷰 수정
	public int reviewUpdate(ReviewDTO reviewDTO);
	
	// 리뷰 삭제
	public int reviewDelete(int review_no);
	
	// 리뷰 등록 화면 띄울 때 구매한 상품 정보 가져오기
	// public List<OrderDTO> read(Long user_id) throws Exception;

	//================================================================================================
	// 상품 리뷰 가져오기
	public List<ReviewDTO> reviewList(Long item_id) throws Exception;

	// 상품 리뷰 개수 가져오기
	public int reviewCount(Long item_id) throws Exception;
}
