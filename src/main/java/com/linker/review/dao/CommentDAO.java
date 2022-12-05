package com.linker.review.dao;

import java.util.List;

import com.linker.review.dto.CommentDTO;

public interface CommentDAO {
	
	// 제일 큰(최근) 댓글 번호 가져오기
	public Integer getMaxNo();
	
	// 댓글 쓰기
	public int commentInsert(CommentDTO comment) throws Exception;
	
	// 댓글 리스트
	public List<CommentDTO> commentList(int review_no) throws Exception;
	
	// 댓글 삭제
	public int commentDelete(int cno) throws Exception;
	
	// 댓글 수정
	public int commentUpdate(CommentDTO comment) throws Exception;

}
