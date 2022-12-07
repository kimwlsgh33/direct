package com.linker.direct.search.dao;

import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.common.util.Criteria;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dto.SearchDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class SearchDAOImpl implements SearchDAO {

    private final static Logger logger = LoggerFactory.getLogger(SearchDAOImpl.class);

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "com.linker.direct.search";


//    @Override
//    public List<SearchDTO> searchList() throws Exception {
//        logger.info("SearchDAOImpl searchList() 게시글 목록 가져오기.....");
//        List<SearchDTO> searchList = sqlSession.selectList(namespace + ".listAll");
//        logger.info("SearchDAOImpl searchList() Data ==> " + searchList);
//        return searchList;
//    }

    @Override
    public List<SearchDTO> searchListPaging(SearchCriteria cri) throws Exception {
        logger.info("SearchDAOImpl searchListPaging(Criteria cri) 게시글 목록 가져오기..... => paging처리");
        List<SearchDTO> searchListPaging = sqlSession.selectList(namespace + ".searchListPaging", cri);
        logger.info("SearchDAOImpl searchListPaging(Criteria cri) Data ==> " + searchListPaging);
        return searchListPaging;
    }

    //-----------------------------------------------------------------------------------------------------------
    // 전체 게시글 수 구하기 (Paging 처리)
    //-----------------------------------------------------------------------------------------------------------
    @Override
    public int searchListTotalCount(SearchCriteria cri) throws Exception {
        logger.info("SearchDAOImpl searchListTotalCount(Criteria cri) 전체 게시글 수 구하기 (Paging 처리) ==> " + cri);
        return sqlSession.selectOne(namespace + ".searchListTotalCount", cri);
    }

    @Override
    public List<SearchDTO> searchListAll(SearchCriteria cri) throws Exception {
        logger.info("SearchDAOImpl searchListAll(Criteria cri) 게시글 목록 가져오기..... => paging처리" + cri);
        List<SearchDTO> searchListAll = sqlSession.selectList(namespace + ".searchListAll", cri);
        logger.info("SearchDAOImpl searchListAll(Criteria cri) Data ==> " + searchListAll);
        return searchListAll;
    }

    //-----------------------------------------------------------------------------------------------------------
    // 게시글 목록 보기 (Paging 처리)
    //-----------------------------------------------------------------------------------------------------------



}
