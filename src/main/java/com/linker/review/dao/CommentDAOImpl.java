package com.linker.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.linker.review.dto.CommentDTO;

import lombok.extern.java.Log;

@Log
@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.linker.review.mappers.commentMapper";

	// 제일 큰(최근) 댓글 번호 가져오기
	@Override
	public Integer getMaxNo() {
		return sqlSession.selectOne(namespace + ".maxNo");
	}
	
	// 댓글 쓰기
	@Override
	public int commentInsert(CommentDTO commentDTO) throws Exception {
		log.info("CommentDAOImpl insert() => " + commentDTO);
		return sqlSession.insert(namespace + ".commentInsert", commentDTO);
	}

	// 리뷰 번호에 따른 댓글 리스트
	@Override
	public List<CommentDTO> commentList(int review_no) throws Exception {
		log.info("review_no => " + review_no);
		return sqlSession.selectList(namespace + ".commentList", review_no);
	}

	// 댓글 삭제
	@Override
	public int commentDelete(int cno) throws Exception {
		log.info("CommentDAOImpl delete() => " + cno);
		return sqlSession.delete(namespace + ".commentDelete", cno);
	}

}
