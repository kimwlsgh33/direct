package com.linker.direct;

import java.util.List;

import com.linker.direct.category.CategoryVO;
import com.linker.direct.category.CategoryService;
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
@Controller
public class HomeController {
  private final CategoryService categoryService;

  public HomeController(CategoryService categoryService) {
    this.categoryService = categoryService;
  }

  /**
   * Simply selects the home view to render by returning its name.
   */
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Model model, HttpServletRequest request) throws Exception {
    HttpSession session = request.getSession();
    List<CategoryVO> categoryList = categoryService.listAll();
    model.addAttribute("categoryList", categoryList);
    return "home";
  }
}
