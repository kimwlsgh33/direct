package com.linker.direct.store.dao;

import com.linker.direct.store.entity.ItemImg;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@RequiredArgsConstructor
public class ItemImgDaoImpl implements ItemImgDao {
    private final SqlSession sqlSession;
    private final String NAMESPACE = "com.linker.direct.store.dao.ItemImgDao.";

    public void create(ItemImg itemImg) throws DataAccessException {
        sqlSession.insert(NAMESPACE + "create", itemImg);
    }

    @Override
    public List<ItemImg> readItemImgs(int itemId) throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + "readItemImgs", itemId);
    }
}
