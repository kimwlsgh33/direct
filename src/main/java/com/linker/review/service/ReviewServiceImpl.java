package com.linker.review.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.linker.review.dao.ReviewDAO;
import com.linker.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);

	@Inject
	private ReviewDAO reviewDAO;
	
	@Override
	public int reviewRegister(ReviewDTO reviewDTO) throws Exception {
		
		/* if(reviewDAO.getMaxNo() == null) {	// 리뷰가 하나도 없는 경우(맨 처음으로 리뷰 등록할 때)
		reviewDTO.setNo(1);  // 리뷰 번호는 1로 한다.
		} else {	// 리뷰가 하나라도 존재하면
		reviewDTO.setNo(reviewDAO.getMaxNo() + 1);  // 최대값에 1을 더한 값을 리뷰 번호로 한다.
		} */
		
		logger.info("ReviewServiceImpl 리뷰 등록화면 불러오기 => " + reviewDTO);
		return reviewDAO.reviewRegister(reviewDTO);
	}

	// 리뷰 목록 가져오기
	@Override
	public List<ReviewDTO> reviewList() throws Exception {
		
		logger.info("ReviewServiceImpl 리뷰 목록 가져오기......");
		return reviewDAO.reviewList();
	}

	// 리뷰 상세조회
	@Override
	public ReviewDTO reviewDetail(int review_no) throws Exception {
		
		return reviewDAO.reviewDetail(review_no);
	}

	// 리뷰 수정
	@Override
	public int reviewUpdate(ReviewDTO reviewDTO) {
		logger.info("ReviewServiceImpl  리뷰 수정하기....." + reviewDTO);
		System.out.println("ReviewServiceImpl  리뷰 수정하기.....");
		return reviewDAO.reviewUpdate(reviewDTO);
	}

	// 리뷰 삭제
	@Override
	public int reviewDelete(int review_no) {
		logger.info("ReviewServiceImpl  리뷰 삭제하기.....");
		return reviewDAO.reviewDelete(review_no);
	}

}
