package com.linker.review.dao;

import java.util.List;

import com.linker.review.dto.ReviewDTO;

public interface ReviewDAO {
	
	// 제일 큰(최근) 리뷰 번호 가져오기
	public Integer getMaxNo();
	
	// 리뷰 등록 처리
	public int reviewRegister(ReviewDTO reviewDTO);
	
	// 리뷰 목록 가져오기
	public List<ReviewDTO> reviewList() throws Exception;

}
