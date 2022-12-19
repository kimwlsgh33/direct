package com.linker.direct;

import java.util.List;

import com.linker.direct.category.CategoryVO;
import com.linker.direct.category.CategoryService;
import com.linker.direct.item.dto.ItemRecommDTO;
import com.linker.direct.item.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@RequiredArgsConstructor
@Controller
public class HomeController {
  private final ItemService itemService;
  private final CategoryService categoryService;

  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Model model, HttpServletRequest request) throws Exception {
    HttpSession session = request.getSession();
    List<CategoryVO> categoryList = categoryService.listAll();
    List<ItemRecommDTO> recommendList = itemService.recommendList();
    List<ItemRecommDTO> saleList = itemService.recommendList();
    model.addAttribute("categoryList", categoryList);
    model.addAttribute("recommendList", recommendList);
    model.addAttribute("saleList", saleList);
    return "home";
  }
}
