package com.linker.direct.product.service;

import com.linker.direct.product.dto.OrderItemVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProductService {

		// 회원 전체 목록 가져오기
		public List<OrderItemVO> productList() throws DataAccessException;
		
		// 상품번호에 해당하는 상품정보 추출하기
		public List<OrderItemVO> selectProduct(Long item_id) throws DataAccessException;

		// user_id에 해당하는 상품정보 추출하기
		public List<OrderItemVO> productRefund (Long user_id) throws DataAccessException;
}
