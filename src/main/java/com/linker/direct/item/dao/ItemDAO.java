package com.linker.direct.item.dao;

import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.search.dto.itemDTO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemDAO {
    void create(ItemVO itemVO) throws DataAccessException;

    ItemVO read(ItemVO itemVO) throws DataAccessException;

    List<ItemVO> searchListPaging(SearchCriteria cri) throws DataAccessException;

    int totalCount(SearchCriteria cri) throws DataAccessException;

    List<ItemVO> searchListAll(SearchCriteria cri) throws DataAccessException;
}
