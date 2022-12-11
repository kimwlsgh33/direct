package com.linker.direct.category;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {

  private final CategoryService categoryService;

  public CategoryController(CategoryService categoryService) {
    this.categoryService = categoryService;
  }

  @RequestMapping("/list")
  public String listAll(Model model) throws Exception {
    model.addAttribute("categoryList", categoryService.listAll());
    return "/category/list";
  }

  @RequestMapping("/createForm")
  public String createForm() throws Exception {
    return "/category/create";
  }

  @ResponseBody
  @RequestMapping(value="/create", method = RequestMethod.POST)
  public String create(CategoryVO categoryVO) throws Exception {
    categoryService.create(categoryVO);
    return "Y";
  }

    @RequestMapping("/read")
    public void read(int id, Model model) throws Exception {
      CategoryDto categoryDto = new CategoryDto();
      categoryDto.setId(id);
      model.addAttribute("category", categoryService.read(categoryDto));
    }

    @RequestMapping("/updateForm")
    public String updateForm(int id, Model model) throws Exception {
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setId(id);
        model.addAttribute("category", categoryService.read(categoryDto));
        return "/category/update";
    }

    @ResponseBody
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public String update(CategoryVO categoryVO) throws Exception {
      System.out.println(categoryVO.toString());
      categoryService.update(categoryVO);
      return "success";
    }

    @RequestMapping("/delete")
    public String delete(int id) throws Exception {
      CategoryDto categoryDto = new CategoryDto();
      categoryDto.setId(id);
      categoryService.delete(categoryDto);
      return "redirect:/category/list";
    }
}
