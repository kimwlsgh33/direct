package com.linker.direct.search.service;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dto.SearchDTO;

import java.util.List;

public interface SearchService {
//    public List<SearchDTO> searchList() throws Exception;

    public List<SearchDTO> searchListPaging(SearchCriteria cri) throws Exception;

    public int searchListTotalCount(SearchCriteria cri) throws Exception;

    public List<SearchDTO> searchListAll(SearchCriteria cri) throws Exception;


}
