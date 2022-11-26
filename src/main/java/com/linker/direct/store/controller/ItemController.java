package com.linker.direct.store.controller;

import com.linker.direct.store.entity.Item;
import com.linker.direct.store.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/store/item")
public class ItemController {
  private final ItemService itemService;

  ItemController(ItemService itemService) {
    this.itemService = itemService;
  }

  @RequestMapping("/list")
    public void list(Model model) throws Exception {
        log.info("ItemController/list() 실행");
        model.addAttribute("list", itemService.listAll());
    }

  @RequestMapping("/create")
  public void create(Item item) throws Exception {
    log.info("ItemControllerImpl/create() 실행");
    itemService.create(item);
  }

  @RequestMapping("/read")
  public void read(String id, Model model) throws Exception {
    log.info("ItemControllerImpl/read() 실행");
    model.addAttribute(itemService.read(id));
  }

  @RequestMapping("/update")
  public void update(Item item) throws Exception {
    log.info("ItemControllerImpl/update() 실행");
    itemService.update(item);
  }

  @RequestMapping("/delete")
  public void delete(String id) throws Exception {
    log.info("ItemControllerImpl/delete() 실행");
    itemService.delete(id);
  }
}
