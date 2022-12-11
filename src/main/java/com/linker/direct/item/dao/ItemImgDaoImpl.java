package com.linker.direct.item.dao;

import com.linker.direct.item.vo.ItemImgVO;
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
    private static final String NAMESPACE = "itemImg";
    /*
    NAMESPACE 를 static으로 선언하는 이유 : NAMESPACE는 상수이기 때문에 static으로 선언해주는 것이 좋다.
    상수는 변하지 않는 값이기 때문에 static으로 선언해주면 메모리에 한번만 올라가기 때문에 메모리를 절약할 수 있다.

    Java에서 static 변수는 클래스가 로딩될 때 메모리에 할당되고, 프로그램이 종료될 때까지 메모리에 남아있게 된다.

    반면에 stack 영역에는 메소드가 호출될 때 할당되고, 메소드가 종료되면 메모리에서 사라지게 된다.
     */

    public void create(ItemImgVO itemImgVO) throws DataAccessException {
        System.out.println("ItemImgDaoImpl.create" + itemImgVO.toString());
        sqlSession.insert(NAMESPACE + ".create", itemImgVO);
    }

    @Override
    public List<ItemImgVO> readItemImgs(int itemId) throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + ".readItemImg", itemId);
    }
}
