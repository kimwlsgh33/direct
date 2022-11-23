package com.linker.direct.searchResult.service;

import com.linker.direct.searchResult.dto.SRDTO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface SRService {

        // 검색한 상품 리스트 불러오기
        public List<SRDTO> productList() throws Exception;

}
