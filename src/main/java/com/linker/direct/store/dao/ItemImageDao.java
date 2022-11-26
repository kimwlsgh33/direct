package com.linker.direct.store.dao;

import com.linker.direct.store.entity.ItemImg;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ItemImageDao {
    private final SqlSession sqlSession;

    public ItemImg findById(String itemImgId) {
        return sqlSession.selectOne("findById", itemImgId);
    }

    public void save(ItemImg itemImg) {
        sqlSession.insert("save", itemImg);
    }
}
