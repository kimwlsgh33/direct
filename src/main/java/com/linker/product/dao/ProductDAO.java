package com.linker.product.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.member.vo.MemberVO;
import com.linker.product.dto.ProductDTO;

public interface ProductDAO {
	
	// 상품목록 가져오기
	public List<ProductDTO>selelctAllProduct() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디에 해당하는 상품 정보 가져오기
	//-----------------------------------------------------------------------------------------------------------
	public List<ProductDTO> selectProduct(String id) throws DataAccessException;

}
