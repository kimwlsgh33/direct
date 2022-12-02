package com.linker.direct.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/order")
public class OrderController {

    @RequestMapping("/create")
    public String create() {
        return "store/order/create";
    }

    @RequestMapping("/list")
    public String order() {
        return "store/order/index";
    }
}
