package com.linker.direct;

import java.util.List;
import java.util.Locale;

import com.linker.direct.store.entity.Category;
import com.linker.direct.store.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
  public String home(Locale locale, Model model) throws Exception {
    List<Category> categories = categoryService.listAll();
    model.addAttribute("categories", categories);

    return "home";
  }

}
