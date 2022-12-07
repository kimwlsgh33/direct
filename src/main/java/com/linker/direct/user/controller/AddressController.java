package com.linker.direct.user.controller;

import com.linker.direct.store.service.AddressService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/address")
public class AddressController {
    private final AddressService addressService;

    @RequestMapping("/listAll")
    public String listAll(Model model) throws Exception {
        model.addAttribute("addressList", addressService.listAll());
        return "address/list";
    }
}
