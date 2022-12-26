package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;

import org.springframework.dao.DataAccessException;

public interface ItemOptionDAO {
    void create(ItemOptionVO itemOptionVO) throws DataAccessException;

    ItemOptionVO read(ItemOptionVO itemOptionVO) throws DataAccessException;

	//ItemOptionVO readByItem(ItemVO itemVO) throws DataAccessException;
}
