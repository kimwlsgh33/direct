package com.linker.direct.review.controller;

import com.linker.direct.review.dto.CommentDTO;
import com.linker.direct.review.service.CommentService;
import lombok.extern.java.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Log
@Controller
@RequestMapping("/comment/*")
public class CommentController {

	// @Resource(name="com.linker.review.service.CommentService")
	@Inject
	CommentService commentService;
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping("/insert")
	private int commentInsert(@RequestParam int review_no, @RequestParam String content) throws Exception {
		
		System.out.println("CommentController insert() Start.....");
		System.out.println("review_no[" + review_no + "]");
		System.out.println("content[" + content + "]");
		
		CommentDTO comment = new CommentDTO();
		comment.setReview_no(review_no);
		comment.setContent(content);
		comment.setWriter("Direct");
		
		return commentService.commentInsert(comment);
	}
	
	// 리뷰 번호에 따른 댓글 리스트
	@ResponseBody
	@RequestMapping(value="/list", method=RequestMethod.GET)
	private List<CommentDTO> commentList(int review_no, Model model) throws Exception {
		
		log.info("CommentController commentList() review_no => " + review_no);
		List<CommentDTO> cList = commentService.commentList(review_no);
		model.addAttribute("comment", cList);
		
		log.info("댓글 리스트 가져오기 : " + cList);
		return cList;
	}
	
	// 댓글 삭제
	@RequestMapping("/delete/{cno}")
	@ResponseBody
	private int commentDelete(@PathVariable int cno) throws Exception {
		System.out.println("CommentController commentDelete...");
		return commentService.commentDelete(cno);
	}
	
	// 댓글 수정
	@RequestMapping("/update")
	@ResponseBody
	private int commentUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception {
		System.out.println("CommentController commentUpdateProc...");
		
		CommentDTO comment = new CommentDTO();
		comment.setCno(cno);
		comment.setContent(content);
		
		return commentService.commentUpdate(comment);
	}
	
}
