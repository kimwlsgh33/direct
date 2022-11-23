package com.linker.product.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.product.dto.ProductDTO;

public interface ProductService {

		// 회원 전체 목록 가져오기
		public List<ProductDTO> productList() throws DataAccessException;
		
		// 해당 아이디 상품 목록 조회
		public List<ProductDTO> selectProduct(String id) throws DataAccessException;
	
}
