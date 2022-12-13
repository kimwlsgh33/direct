package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemImgDAO {
    void create(ItemImgVO itemImgVO) throws DataAccessException;

    List<ItemImgVO> readByItem(ItemVO itemVO) throws DataAccessException;
}
