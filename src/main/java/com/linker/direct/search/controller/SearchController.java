package com.linker.direct.search.controller;


import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.cart.service.CartService;
import com.linker.direct.common.util.PageMaker;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.search.dto.itemDTO;
import com.linker.direct.search.service.SearchService;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;

import java.util.List;

import static org.slf4j.LoggerFactory.*;

@Controller
@RequestMapping("/search/*")
public class SearchController {

    private final static Logger logger = getLogger(SearchController.class);

    @Inject
    private SearchService searchService;

    @Inject
    private CartService cartService;

//    @RequestMapping(value = "/searchList", method = RequestMethod.GET)
//    public void searchList(Model model) throws Exception {
//        logger.info("SearchController searchList() 게시글 목록 가져오기..");
//        List<SearchDTO> searchList = searchService.searchList();
//        logger.info("SearchController searchList() Data ==> " + searchList);
//        model.addAttribute("searchList", searchList);
//    }

//    @RequestMapping(value="/searchList", method = RequestMethod.GET)
//    public ModelAndView searchListPaging(Criteria cri) throws Exception {
//
//        logger.info("SearchController searchListPaging(Criteria criteria) 게시글 목록 가져오기..... => paging처리");
//        ModelAndView mav = new ModelAndView("search/searchList");
//        List<SearchDTO> searchListPaging = searchService.searchListPaging(cri);
//        logger.info("SearchController searchListPaging(Criteria criteria) Data ==> " + searchListPaging);
//        mav.addObject("searchListPaging", searchListPaging);
//        mav.setViewName("search/searchList");
//        return mav;
//    }

    @RequestMapping(value = "/searchList", method = RequestMethod.GET)
    public ModelAndView searchList(SearchCriteria cri, itemDTO itemDTO, CartDTO cartDTO) throws Exception {

        logger.info("------------------------------------------------------------------------");
        logger.info("BoardController 게시글 목록 보여주기 (Paging 처리) cri ==> " + cri);
        logger.info("------------------------------------------------------------------------");

        ModelAndView mav = new ModelAndView("/search/searchList");


        mav.addObject("keyword",	cri.getKeyword());

        String subFilter = cri.getSubFilter();


        String keyword = cri.getKeyword();
        logger.info("keyword ==> " + keyword);
        if(keyword == "") {
            mav.setViewName("/search/noSearch");
        }else {
            mav.setViewName("/search/searchList");
        }

        if(subFilter == null){
            subFilter  = "lowPrice";
            logger.info("if문 안에 들어가냐??");
            logger.info("subFilter ==> " + subFilter);
        }

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        // 게시글 전체 개수를 구한다.
        pageMaker.setTotalCount(searchService.searchListTotalCount(cri));
        logger.info("SearchController 게시글 목록 보여주기 (Paging 처리) "
                + "pageMaker.getTotalCount() ==> " + pageMaker.getTotalCount());



        // cri에 해당하는 게시글을 가져와서 View에게 넘겨준다.
        List<itemDTO> searchList = searchService.searchListPaging(cri);


        logger.info("SearchController 게시글 목록 보여주기 (Paging 처리) " +
                "cri에 해당하는 게시글을 가져와서 View에게 넘겨준다. ==> END END END" + pageMaker);
        mav.addObject("searchList", searchList);
        mav.addObject("pageMaker", pageMaker);
        logger.info("searchDTO ====> " + itemDTO);
        mav.addObject("item_id", cartDTO.getItem_id());
        mav.addObject("product_count", cartDTO.getCount());
        mav.addObject("cart_date", cartDTO.getCreated_at());
        mav.addObject("subFilter", cri.getSubFilter());
        mav.addObject("perPageNum", cri.getPerPageNum());
        mav.addObject("searchListAll", searchService.searchListAll(cri));
        mav.addObject("user_id", cartDTO.getUser_id());

        return mav;
    }


}
