package com.linker.direct.review.dao;

import com.linker.direct.review.dto.CommentDTO;
import lombok.extern.java.Log;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Log
@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.linker.direct.review.mappers.commentMapper";

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

	// 댓글 수정
	@Override
	public int commentUpdate(CommentDTO commentDTO) throws Exception {
		log.info("CommentDAOImpl update() => " + commentDTO);
		return sqlSession.update(namespace + ".commentUpdate", commentDTO);
	}

}