package com.linker.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.linker.review.dao.CommentDAO;
import com.linker.review.dto.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	CommentDAO commentDAO;

	// 댓글 쓰기
	@Override
	public int commentInsert(CommentDTO comment) throws Exception {
		return commentDAO.commentInsert(comment);
	}

	// 댓글 리스트
	@Override
	public List<CommentDTO> commentList(int review_no) throws Exception {
		return commentDAO.commentList(review_no);
	}

	// 댓글 삭제
	@Override
	public int commentDelete(int cno) throws Exception {
		return commentDAO.commentDelete(cno);
	}

}
