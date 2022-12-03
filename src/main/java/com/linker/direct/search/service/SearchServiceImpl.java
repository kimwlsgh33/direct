package com.linker.direct.search.service;

import com.linker.direct.common.util.Criteria;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dao.SearchDAO;
import com.linker.direct.search.dto.SearchDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {

    private final static Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);

    @Inject
    private SearchDAO searchDAO;


//    @Override
//    public List<SearchDTO> searchList() throws Exception {
//        logger.info("SearchServiceImpl searchList() 게시글 목록 가져오기.....");
//        List<SearchDTO> searchList = searchDAO.searchList();
//        logger.info("SearchServiceImpl searchList() Data ==> " + searchList);
//        return searchList;
//    }

    @Override
    public List<SearchDTO> searchListPaging(SearchCriteria cri) throws Exception {
        logger.info("SearchServiceImpl searchListPaging(Criteria criteria) 게시글 목록 가져오기..... => paging처리");
        List<SearchDTO> searchListPaging = searchDAO.searchListPaging(cri);
        logger.info("SearchServiceImpl searchListPaging(Criteria criteria) Data ==> " + searchListPaging);
        return searchListPaging;
    }
    @Override
    public int searchListTotalCount(SearchCriteria cri) throws Exception {
        logger.info("searchServiceImpl 전체 게시글 수 구하기 (Paging 처리) => " + cri);
        return searchDAO.searchListTotalCount(cri);
    }

    @Override
    public List<SearchDTO> searchListAll(SearchCriteria cri) throws Exception {
        logger.info("searchServiceImpl 전체 게시글 수 구하기 (Paging 처리) => " + cri);
        return searchDAO.searchListAll(cri);
    }
}
