package com.linker.direct.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {
        @RequestMapping("/list")
        public void list() {
            System.out.println("store list");
        }
}
