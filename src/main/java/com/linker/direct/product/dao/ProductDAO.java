package com.linker.direct.product.dao;

import com.linker.direct.product.dto.ProductDTO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProductDAO {
	
	// 상품목록 가져오기
	public List<ProductDTO>selelctAllProduct() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 상품번호에 해당하는 상품정보 추출하기
	//-----------------------------------------------------------------------------------------------------------
	public List<ProductDTO> selectProduct(Long item_id) throws DataAccessException;
	
	// user_id에 해당하는 상품정보 추출하기
	public List<ProductDTO> read(Long user_id) throws DataAccessException;
	
	// user_id에 해당하는 상품정보 추출하기
	public List<ProductDTO> readRefund(Long user_id) throws DataAccessException;

}
