package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemImgVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemImgDao {
    void create(ItemImgVO itemImgVO) throws DataAccessException;

    List<ItemImgVO> readItemImgs(int itemId) throws DataAccessException;
}
