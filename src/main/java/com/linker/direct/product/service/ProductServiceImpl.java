package com.linker.direct.product.service;

import com.linker.direct.product.dao.ProductDAO;
import com.linker.direct.product.dto.OrderItemVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDAO ProductDAO;
	
	// 상품목록 가져오기
	@Override
	public List<OrderItemVO> productList() throws DataAccessException {
		
		logger.info("ProductController 상품 목록 조회 시작......");
		List<OrderItemVO> productList = null;
		productList = ProductDAO.selelctAllProduct();
		
		return productList;
	}

	// 상품번호에 해당하는 상품정보 추출하기
	@Override
	public List<OrderItemVO> selectProduct(Long item_id) throws DataAccessException {
		
		logger.info("ProductController 아이디에 해당하는 상품 목록 조회 시작......");
		List<OrderItemVO> OrderItemVO = ProductDAO.selectProduct(item_id);
		return OrderItemVO;
	}

	// user_id에 해당하는 상품정보 추출하기
	@Override
	public List<OrderItemVO> productRefund(Long user_id) throws DataAccessException {
		List<OrderItemVO> OrderItemVO = ProductDAO.readRefund(user_id);
		return OrderItemVO;
	}


}
