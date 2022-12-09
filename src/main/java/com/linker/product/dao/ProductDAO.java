package com.linker.product.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.linker.member.vo.MemberVO;
import com.linker.product.dto.ProductDTO;

public interface ProductDAO {
	
	// 상품목록 가져오기
	public List<ProductDTO>selelctAllProduct() throws DataAccessException;
	
	//-----------------------------------------------------------------------------------------------------------
	// 상품번호에 해당하는 상품정보 추출하기
	//-----------------------------------------------------------------------------------------------------------
	public List<ProductDTO> selectProduct(int product_no) throws DataAccessException;
	
	// user_id에 해당하는 상품정보 추출하기
	public List<ProductDTO> read(int user_id) throws DataAccessException;

}
