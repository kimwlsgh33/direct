package com.linker.direct.search.dao;

import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dto.itemDTO;

import java.util.List;

public interface SearchDAO {

//    public List<SearchDTO> searchList() throws Exception;

    public List<itemDTO> searchListPaging(SearchCriteria cri) throws Exception;

    public int searchListTotalCount(SearchCriteria cri) throws Exception;

    public List<itemDTO> searchListAll(SearchCriteria cri) throws Exception;


}
