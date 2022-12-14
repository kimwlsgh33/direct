package com.linker.direct.review.service;

import com.linker.direct.review.dao.CommentDAO;
import com.linker.direct.review.dto.CommentDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

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
	public List<CommentDTO> commentList(Long review_no) throws Exception {
		return commentDAO.commentList(review_no);
	}

	// 댓글 삭제
	@Override
	public int commentDelete(int cno) throws Exception {
		return commentDAO.commentDelete(cno);
	}

	// 댓글 수정
	@Override
	public int commentUpdate(CommentDTO comment) throws Exception {
		return commentDAO.commentUpdate(comment);
	}

}
