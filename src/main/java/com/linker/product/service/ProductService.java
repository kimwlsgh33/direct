package com.linker.product.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.product.dto.ProductDTO;

public interface ProductService {

		// 회원 전체 목록 가져오기
		public List<ProductDTO> productList() throws DataAccessException;
		
		// 상품번호에 해당하는 상품정보 추출하기
		public List<ProductDTO> selectProduct(int product_no) throws DataAccessException;

	
}
