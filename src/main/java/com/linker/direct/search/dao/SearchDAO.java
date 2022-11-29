package com.linker.direct.search.dao;

import com.linker.direct.common.util.Criteria;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dto.SearchDTO;

import java.util.List;

public interface SearchDAO {

//    public List<SearchDTO> searchList() throws Exception;

    public List<SearchDTO> searchListPaging(SearchCriteria cri) throws Exception;

    public int searchListTotalCount(SearchCriteria cri) throws Exception;

}
