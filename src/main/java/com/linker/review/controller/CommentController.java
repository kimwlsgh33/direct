package com.linker.review.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.linker.review.dto.CommentDTO;
import com.linker.review.service.CommentService;

import lombok.extern.java.Log;

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
	
}
