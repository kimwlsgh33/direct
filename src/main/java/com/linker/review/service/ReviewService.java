package com.linker.review.service;

import java.util.List;

import com.linker.review.dto.ReviewDTO;

public interface ReviewService {
	
	// 리뷰 등록 처리
	public int reviewRegister(ReviewDTO reviewDTO) throws Exception;
	
	// 리뷰 목록 가져오기
	public List<ReviewDTO> reviewList() throws Exception;

}
