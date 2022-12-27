package com.linker.direct.item.dao;

// vo
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemRecommDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ItemDAOImpl implements ItemDAO {
    private final SqlSession sqlSession;

    private static final String NAMESPACE = "item";

    //==================================================================================================
    // 상품 등록
    //==================================================================================================
    @Override
    public void create(ItemVO itemVO) throws DataAccessException {
        sqlSession.insert(NAMESPACE + ".create", itemVO);
    }

    //==================================================================================================
    // 상품 읽기
    //==================================================================================================
    @Override
    public ItemVO read(ItemVO itemVO) throws DataAccessException {
        return sqlSession.selectOne(NAMESPACE + ".read", itemVO);
    }

    //==================================================================================================
    // 검색 상품 리스트 (페이징)
    //==================================================================================================
    @Override
    public List<ItemVO> searchListPaging(SearchCriteria cri) throws DataAccessException {
        List<ItemVO> searchListPaging = sqlSession.selectList(NAMESPACE + ".searchListPaging", cri);
        return searchListPaging;
    }

    //==================================================================================================
    // 상품 전체 개수
    //==================================================================================================
    @Override
    public int totalCount(SearchCriteria cri) throws DataAccessException {
        return sqlSession.selectOne(NAMESPACE + ".searchListTotalCount", cri);
    }


    //==================================================================================================
    // 검색 상품 전체 리스트
    //==================================================================================================
    @Override
    public List<ItemVO> searchListAll(SearchCriteria cri) throws DataAccessException {
        List<ItemVO> searchListAll = sqlSession.selectList(NAMESPACE + ".searchListAll", cri);
        return searchListAll;
    }
    
    // 추천 상품 리스트
    @Override
    public List<ItemRecommDTO> recommendList() throws DataAccessException {
        return sqlSession.selectList(NAMESPACE + ".recommendList");
    }
}
