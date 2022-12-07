package com.linker.direct.store.dao;

import com.linker.direct.store.vo.ItemImg;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemImgDao {
    void create(ItemImg itemImg) throws DataAccessException;

    List<ItemImg> readItemImgs(int itemId) throws DataAccessException;
}
