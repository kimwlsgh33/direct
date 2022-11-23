package com.linker.direct.searchResult.dao;

import com.linker.direct.searchResult.controller.SRController;
import com.linker.direct.searchResult.dto.SRDTO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class SRDAOImpl implements SRDAO {

    private static final Logger logger = LoggerFactory.getLogger(SRDAO.class);

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "com.linker.direct.searchResult";

    @Override
    public List<SRDTO> ProductList() throws Exception {
        logger.info("SRDTO // ProductList 검색목록 가져오기........");
        List<SRDTO> srProductLists = sqlSession.selectList(namespace + ".listAll");
        logger.info("SRDAOImpl productList() Data ==> " + srProductLists);
        return srProductLists;
    }

    @Override
    public void updateClickCount(int seq) {
        logger.info("SRDTO // updateClickCount 게시글 조회수 증가........");
        sqlSession.update(namespace + ".updateClickCount", seq);
    }

    @Override
    public SRDTO ProductDetail(int seq) {
        logger.info("SRDTO // ProductDetail 게시글 상세보기........");
        return sqlSession.selectOne(namespace + ".detail", seq);
    }

    @Override
    public int ProductDelete(int seq) {
        return 0;
    }

    @Override
    public int ProductUpdate(SRDTO srDTO) {
        return 0;
    }

    @Override
    public int ProductRegister(SRDTO srDTO) {
        return 0;
    }
}
