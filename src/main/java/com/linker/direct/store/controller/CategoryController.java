package com.linker.direct.store.controller;

import com.linker.direct.store.entity.Category;
import com.linker.direct.store.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/store/category")
public class CategoryController {

  private final CategoryService categoryService;

  public CategoryController(CategoryService categoryService) {
    this.categoryService = categoryService;
  }

  @RequestMapping("/list")
  public String listAll(Model model) throws Exception {
    log.info("CategoryController/listAll() 호출");
    model.addAttribute("categoryList", categoryService.listAll());
    return "/store/category/list";
  }

  @RequestMapping("/createForm")
  public String createForm() throws Exception {
    log.info("CategoryController/createForm() 호출");
    return "/store/category/create";
  }

  @ResponseBody
  @RequestMapping(value="/create", method = RequestMethod.POST)
  public String create(Category category) throws Exception {
    log.info("CategoryController/create() 호출");
    log.info("name: " + category.getName());
    categoryService.create(category);
    return "Y";
  }

  @RequestMapping("/read")
  public void read(int id, Model model) throws Exception {
    log.info("CategoryController/read() 호출");
    model.addAttribute("category", categoryService.read(id));
  }

    @RequestMapping("/updateForm")
    public String updateForm(int id, Model model) throws Exception {
        log.info("CategoryController/updateForm() 호출");
        model.addAttribute("category", categoryService.read(id));
        return "/store/category/update";
    }

    @ResponseBody
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public String update(Category category) throws Exception {
      log.info("CategoryController/update() 호출");
      categoryService.update(category);
      return "Y";
    }

    @RequestMapping("/delete")
    public String delete(int id) throws Exception {
      log.info("CategoryController/delete() 호출");
      categoryService.delete(id);
      return "redirect:/store/category/list";
    }
}
