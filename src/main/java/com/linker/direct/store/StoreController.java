package com.linker.direct.store;

import com.linker.direct.category.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class StoreController {
    private final StoreService storeService;
    private final CategoryService categoryService;
    @RequestMapping("/list")
    public void list(Model model) throws Exception {
        model.addAttribute("storeList",storeService.listAll());
    }

    @RequestMapping("/createForm")
    public String createForm(Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("categoryList", categoryService.listAll());
        return "store/create";
    }

    @RequestMapping("/create")
    public String create(HttpServletRequest request, StoreFormDto storeFormDto) throws Exception {
        storeService.create(storeFormDto);
        return "redirect:/store/list";
    }


    @RequestMapping("/detail")
    public String detail(Model model, HttpServletRequest request, StoreDto storeDto) throws Exception {
        model.addAttribute("store", storeService.read(storeDto));
        return "store/detail";
    }

    @RequestMapping("/updateForm")
    public String updateForm(Model model, HttpServletRequest request, StoreDto storeDto) throws Exception {
        model.addAttribute("store", storeService.read(storeDto));
        model.addAttribute("categoryList", categoryService.listAll());
        return "store/update";
    }

    @ResponseBody
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String update(StoreFormDto storeFormDto) throws Exception {
        storeService.update(storeFormDto);
        return "success";
    }

    @RequestMapping("/delete")
    public String delete(StoreDto storeDto) throws Exception {
        storeService.delete(storeDto);
        return "redirect:/store/list";
    }
}
