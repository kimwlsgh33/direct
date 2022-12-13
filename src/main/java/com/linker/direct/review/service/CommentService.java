package com.linker.direct.review.service;

import java.util.List;

import com.linker.direct.review.dto.CommentDTO;

public interface CommentService {
	
	// 댓글 쓰기
	public int commentInsert(CommentDTO comment) throws Exception;
	
	// 댓글 리스트
	public List<CommentDTO> commentList(int review_no) throws Exception;
	
	// 댓글 삭제
	public int commentDelete(int cno) throws Exception;
	
	// 댓글 수정
	public int commentUpdate(CommentDTO comment) throws Exception;

}
