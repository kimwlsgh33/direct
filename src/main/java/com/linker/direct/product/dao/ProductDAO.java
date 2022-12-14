package com.linker.direct.product.dao;

import com.linker.direct.product.dto.OrderItemVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProductDAO {
	
	// 상품목록 가져오기
	public List<OrderItemVO>selelctAllProduct() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 상품번호에 해당하는 상품정보 추출하기
	//-----------------------------------------------------------------------------------------------------------
	public List<OrderItemVO> selectProduct(Long item_id) throws DataAccessException;
	
	// user_id에 해당하는 상품정보 추출하기
	public List<OrderItemVO> read(Long user_id) throws DataAccessException;
	
	// user_id에 해당하는 상품정보 추출하기
	public List<OrderItemVO> readRefund(Long user_id) throws DataAccessException;

}
