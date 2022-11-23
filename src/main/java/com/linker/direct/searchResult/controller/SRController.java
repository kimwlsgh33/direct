package com.linker.direct.searchResult.controller;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SRController {

    // 검색한 상품 화면 불러오기
    public void productList (Model model) throws Exception;
}
