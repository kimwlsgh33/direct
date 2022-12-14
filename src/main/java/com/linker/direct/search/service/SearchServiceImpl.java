package com.linker.direct.search.service;

import com.linker.direct.cart.dao.CartDAO;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dao.SearchDAO;
import com.linker.direct.search.dto.itemDTO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService {

    private final static Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
    private final SearchDAO searchDAO;
    private final CartDAO cartDAO;
//    @Override
//    public List<SearchDTO> searchList() throws Exception {
//        logger.info("SearchServiceImpl searchList() 게시글 목록 가져오기.....");
//        List<SearchDTO> searchList = searchDAO.searchList();
//        logger.info("SearchServiceImpl searchList() Data ==> " + searchList);
//        return searchList;
//    }

    @Override
    public List<itemDTO> searchListPaging(SearchCriteria cri) throws Exception {
        logger.info("SearchServiceImpl searchListPaging(Criteria criteria) 게시글 목록 가져오기..... => paging처리");
        List<itemDTO> searchListPaging = searchDAO.searchListPaging(cri);
        logger.info("SearchServiceImpl searchListPaging(Criteria criteria) Data ==> " + searchListPaging);
        return searchListPaging;
    }
    @Override
    public int searchListTotalCount(SearchCriteria cri) throws Exception {
        logger.info("searchServiceImpl 전체 상품 수 구하기 (Paging 처리) => " + cri);
        return searchDAO.searchListTotalCount(cri);
    }

    @Override
    public List<itemDTO> searchListAll(SearchCriteria cri) throws Exception {
        logger.info("searchServiceImpl 상품 목록 가져오기(Paging 처리) => " + cri); ///ㄴ이라ㅓㅈ딜젇리저라ㅣㅈㄷ러디랒렂리ㅏㄷ러
        return searchDAO.searchListAll(cri);
    }

}
