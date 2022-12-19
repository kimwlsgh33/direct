package com.linker.direct.item.dao;

import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.dto.ItemRecommDTO;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemDAO {
    void create(ItemVO itemVO) throws DataAccessException;

    ItemVO read(ItemVO itemVO) throws DataAccessException;

    List<ItemVO> searchListPaging(SearchCriteria cri) throws DataAccessException;

    int totalCount(SearchCriteria cri) throws DataAccessException;

    List<ItemVO> searchListAll(SearchCriteria cri) throws DataAccessException;

    List<ItemRecommDTO> recommendList() throws DataAccessException;
}
