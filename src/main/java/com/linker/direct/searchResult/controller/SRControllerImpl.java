package com.linker.direct.searchResult.controller;

import com.linker.direct.searchResult.dto.SRDTO;
import com.linker.direct.searchResult.service.SRService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import java.util.List;

@Controller("SRController")
@RequestMapping("/search/*")
public class SRControllerImpl implements SRController {

    private static final Logger logger = LoggerFactory.getLogger(SRControllerImpl.class);

    @Inject
    private SRService srService;

    @Override
    @RequestMapping(value = "/searchList", method= RequestMethod.GET)
    public void productList(Model model) throws Exception {
        logger.info("ProductList 검색목록 가져오기........");
        List<SRDTO> searchList = srService.productList();

        logger.info("검색목록 ==>" + searchList);
        model.addAttribute("searchList", searchList);
    }
}
