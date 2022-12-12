package com.linker.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.linker.product.dto.ProductDTO;
import com.linker.member.vo.MemberVO;
import com.linker.product.dao.ProductDAO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDAO ProductDAO;
	
	// 상품목록 가져오기
	@Override
	public List<ProductDTO> productList() throws DataAccessException {
		
		logger.info("ProductController 상품 목록 조회 시작......");
		List<ProductDTO> productList = null;
		productList = ProductDAO.selelctAllProduct();
		
		return productList;
	}

	// 상품번호에 해당하는 상품정보 추출하기
	@Override
	public List<ProductDTO> selectProduct(Long item_id) throws DataAccessException {
		
		logger.info("ProductController 아이디에 해당하는 상품 목록 조회 시작......");
		List<ProductDTO> ProductDTO = ProductDAO.selectProduct(item_id);
		return ProductDTO;
	}

	// user_id에 해당하는 상품정보 추출하기
	@Override
	public List<ProductDTO> productRefund(Long user_id) throws DataAccessException {
		List<ProductDTO> ProductDTO = ProductDAO.readRefund(user_id);
		return ProductDTO;
	}


}
