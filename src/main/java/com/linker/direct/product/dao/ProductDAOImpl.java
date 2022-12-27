package com.linker.direct.product.dao;

import com.linker.direct.product.dto.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ProductDAO")
public class ProductDAOImpl implements ProductDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.linker.direct.product";
	
	// 상품목록 가져오기
	@Override
	public List<ProductDTO> selelctAllProduct() throws DataAccessException {
		
		logger.info("ProductController 상품 목록 조회 시작......");
		List<ProductDTO> productList = null;
		productList = sqlSession.selectList(Namespace + ".selectAllProduct" );
		return productList;
	}

	// 상품번호에 해당하는 상품정보 추출하기
	@Override
	public List<ProductDTO> selectProduct(Long item_id) throws DataAccessException {
		
		logger.info("ProductController 아이디에 해당하는 상품 목록 조회 시작......");	
		List<ProductDTO> OrderItemVO = sqlSession.selectList(Namespace + ".selectProduct", item_id);
		return OrderItemVO;
	}
	
	// user_id에 해당하는 상품정보 추출하기
	@Override
	public List<ProductDTO> read(Long user_id) throws DataAccessException {
		
		logger.info("ProductController 아이디에 해당하는 상품 목록 조회 시작......");	
		List<ProductDTO> OrderItemVO = sqlSession.selectList(Namespace + ".readProduct", user_id);
		return OrderItemVO;
	}

	// user_id에 해당하는 상품상태 추출하기
	@Override
	public List<ProductDTO> readRefund(Long user_id) throws DataAccessException {
		List<ProductDTO> OrderItemVO = sqlSession.selectList(Namespace + ".readRefund", user_id);
		return OrderItemVO;
	}

}
