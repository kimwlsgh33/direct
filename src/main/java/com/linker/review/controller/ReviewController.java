package com.linker.review.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.review.dto.ReviewDTO;
import com.linker.review.service.ReviewService;

@Controller
@RequestMapping(value = "/review/*")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService reviewService;
	
		// 리뷰 등록 화면
		// tomcat server module path를 /(루트) 로 수정해야 제대로 작동
		@RequestMapping(value = "/reviewRegisterForm", method = RequestMethod.GET)
		public String reviewRegisterForm() throws Exception {
			
			logger.info("ReviewController 리뷰 등록 화면 불러오기......");
			return "/review/reviewRegisterForm";
			
		}
		
		// 리뷰 등록 처리
		@ResponseBody	// 값만 받는다.
		@RequestMapping(value = "/reviewRegister", method = RequestMethod.POST)
		public String reviewRegister(ReviewDTO reviewDTO) throws Exception {
			
			logger.info("ReviewController 리뷰 등록 처리......");
			logger.info("ReviewDTO 값 : " + reviewDTO);
			
			// review.js의 스크립트 참조
			if(reviewService.reviewRegister(reviewDTO) == 1) {
				return "Y";	// 게시글 등록 완료
			} else {
				return "N";	// 게시글 등록 실패
			}
			
		}
		
		// 리뷰 목록
		@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
		public void reviewList(Model model) throws Exception {
			
			logger.info("ReviewController 리뷰 목록 가져오기......");
			List<ReviewDTO> reviewList = reviewService.reviewList();
			
			logger.info("리뷰 목록 => " + reviewList);
			model.addAttribute("reviewList", reviewList);
			
		}
	
}
