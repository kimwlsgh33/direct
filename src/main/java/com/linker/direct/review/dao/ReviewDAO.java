package com.linker.direct.review.dao;

import com.linker.direct.review.dto.ReviewDTO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ReviewDAO {
	
	// 제일 큰(최근) 리뷰 번호 가져오기
	public Integer getMaxNo();
	
	// 리뷰 등록 처리
	public int reviewRegister(ReviewDTO reviewDTO);
	
	// 리뷰 목록 가져오기
	public List<ReviewDTO> reviewList() throws Exception;
	
	// 리뷰 상세조회
	public ReviewDTO reviewDetail(int review_no);
	
	// 리뷰 수정
	public int reviewUpdate(ReviewDTO reviewDTO);
	
	// 리뷰 삭제
	public int reviewDelete(int review_no);

	// 상품에 해당하는 리뷰
	List<ReviewDTO> reviewList(Long item_id) throws DataAccessException;

	// 상품 리뷰 개수
	int reviewCount(Long item_id) throws DataAccessException;
}
