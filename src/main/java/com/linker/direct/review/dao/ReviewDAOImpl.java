package com.linker.direct.review.dao;

import com.linker.direct.review.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.linker.direct.review";

	// 제일 큰(최근) 리뷰 번호 가져오기
	@Override
	public Integer getMaxNo() {
		return sqlSession.selectOne(namespace + ".maxNo");
	}

	// 리뷰 등록 처리
	@Override
	public int reviewRegister(ReviewDTO reviewDTO) throws Exception {
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

	// 리뷰 상세조회
	@Override
	public ReviewDTO reviewDetail(Long review_no) throws Exception {
		return sqlSession.selectOne(namespace + ".detail", review_no);
	}
	
	// 리뷰 수정
	@Override
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception {
		logger.info("ReviewDAOImpl  리뷰 수정하기....." + reviewDTO);
		System.out.println("ReviewDAOImpl  리뷰 수정하기.....");
		return sqlSession.update(namespace + ".update", reviewDTO);
	}

	// 리뷰 삭제
	@Override
	public int reviewDelete(Long review_no) throws Exception {
		logger.info("ReviewDAOImpl  리뷰 삭제하기.....");
		return sqlSession.delete(namespace + ".delete", review_no);
	}
// 디테일에서 필요한것
	@Override
	public List<ReviewDTO> reviewList(Long item_id) throws DataAccessException {
		logger.info("ReviewDAOImpl 리뷰 목록 가져오기......");
		List<ReviewDTO> reviewList = sqlSession.selectList(namespace + ".listByItem", item_id);
		logger.info("ReviewDAOImpl reviewList() Data = > " + reviewList);
		return reviewList;
	}

	@Override
	public int reviewCount(Long item_id) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".countByItem", item_id);
	}

}
