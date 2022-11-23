package com.linker.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.linker.review.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.linker.review";

	// 제일 큰(최근) 리뷰 번호 가져오기
	@Override
	public Integer getMaxNo() {
		return sqlSession.selectOne(namespace + ".maxNo");
	}

	// 리뷰 등록 처리
	@Override
	public int reviewRegister(ReviewDTO reviewDTO) {
		logger.info("ReviewDAOImpl 리뷰 등록 처리 => " + reviewDTO);
		return sqlSession.insert(namespace + ".insertReview", reviewDTO);
	}

	// 리뷰 목록 가져오기
	@Override
	public List<ReviewDTO> reviewList() throws Exception {
		logger.info("ReviewDAOImpl 리뷰 목록 가져오기......");
		List<ReviewDTO> reviewList = sqlSession.selectList(namespace + ".listAll");
		logger.info("BoardDAOImpl boardList() Data = > " + reviewList);
		return reviewList;
	}

}
