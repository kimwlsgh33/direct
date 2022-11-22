package com.linker.direct.store.controller;

import com.linker.direct.store.entity.Item;
import com.linker.direct.store.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/store/item")
public class ItemControllerImpl implements ItemController {
    private final ItemService itemService;

    ItemControllerImpl(ItemService itemService) {
        this.itemService = itemService;
    }

    @Override
    @RequestMapping("/create")
    public void get(Item item) throws Exception {
        itemService.get(item);
    }
}
