package com.linker.direct.store.dao;

import com.linker.direct.store.dto.ItemImgDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
@RequiredArgsConstructor
public class ItemImgDao {
    private final SqlSession sqlSession;
    private final String NAMESPACE = "com.linker.direct.store.dao.ItemImgDao.";

    public void create(ItemImgDto itemImgDto) {
        sqlSession.insert(NAMESPACE + "create", itemImgDto);
    }
}
