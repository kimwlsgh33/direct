package com.linker.direct.searchResult.service;

import com.linker.direct.searchResult.dao.SRDAO;
import com.linker.direct.searchResult.dto.SRDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import java.util.List;

@Service("srService")
public class SRServiceImpl implements SRService {

    private static final Logger logger = LoggerFactory.getLogger(SRServiceImpl.class);

    @Inject
    private SRDAO srDAO;

    @Override
    public List<SRDTO> productList() throws Exception {

      logger.info("ProductList 검색목록 가져오기........");
      return srDAO.ProductList();
    }
}
