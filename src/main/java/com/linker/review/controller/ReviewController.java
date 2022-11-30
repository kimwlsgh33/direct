package com.linker.review.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
			//List<CommentDTO> cList = reviewService.cList();
			
			logger.info("리뷰 목록 => " + reviewList);
			model.addAttribute("reviewList", reviewList);
			//model.addAttribute("cList", cList);
			
			
		}
		
		// 리뷰 상세 조회
		@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
		public String reviewDetail(Locale locale, Model model, HttpServletRequest request) throws Exception {
			System.out.println("ReviewController reviewDetail() review_no : " + Integer.parseInt((String)request.getParameter("review_no")));
			
			// review_no에 해당하는 리뷰 데이터를 가져온다.
			ReviewDTO reviewDTO = reviewService.reviewDetail(Integer.parseInt((String)request.getParameter("review_no")));
			model.addAttribute("reviewDetail", reviewDTO);
			return "/review/reviewDetail";
		}

		// 리뷰 수정화면
		@RequestMapping(value = "/reviewUpdateForm", method = RequestMethod.POST)
		public String reviewUpdateForm(Locale locale, Model model, HttpServletRequest request) throws Exception {
			
			logger.info("ReviewController 게시글 수정화면 불러오기.....");
			System.out.println("ReviewController reviewUpdateForm() review_no : " + request.getParameter("review_no"));

			ReviewDTO reviewDTO = reviewService.reviewDetail(Integer.parseInt((String)request.getParameter("review_no")));
			model.addAttribute("reviewDetail", reviewDTO);
			logger.info("ReviewController 게시글 수정화면 끝.....");
			return "/review/reviewUpdate";
		}
		
		// 리뷰 수정
		@ResponseBody
		@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
		public String reviewUpdate(Locale locale, Model model, ReviewDTO reviewDTO) throws Exception {
			System.out.println("ReviewController reviewUpdate() reviewDTO : " + reviewDTO);
			if(reviewService.reviewUpdate(reviewDTO) == 1) {
				return "Y";
			}else {
				return "N";
			}
		}
		
		// 리뷰 번호에 해당하는 게시글 삭제
		@ResponseBody
		@RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
		public String reviewDelete(Locale locale, Model model, HttpServletRequest request) throws Exception {
			System.out.println("ReviewController reviewDelete() review_no : " + request.getParameter("review_no"));

			if(reviewService.reviewDelete(Integer.parseInt((String)request.getParameter("review_no"))) == 1) {
				return "Y";
			}else {
				return "N";
			}
		}
		
		// 댓글 달 수 있는 상세정보 화면
		@RequestMapping("/detailComment/{review_no}")
		private String reviewDetailComment(@PathVariable int review_no, Model model) throws Exception {
			// review_no 에 해당하는 자료를 찾아서 model에 담는다.
			model.addAttribute("detail", reviewService.reviewDetail(review_no));
			return "/review/detailComment";
		}
	
}
