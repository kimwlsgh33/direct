package com.linker.direct.store.controller;

import com.linker.direct.store.dto.ItemDto;
import com.linker.direct.store.dto.ItemImgDto;
import com.linker.direct.store.entity.Category;
import com.linker.direct.store.entity.Item;
import com.linker.direct.store.service.CategoryService;
import com.linker.direct.store.service.ItemService;
import com.linker.direct.store.service.ItemImgService;
import com.linker.direct.user.entity.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/store/item")
@RequiredArgsConstructor
public class ItemController {
    private final ItemService itemService;
    private final CategoryService categoryService;
    private final ItemImgService itemImgService;

    @RequestMapping("/createForm")
    public String createForm(Model model) throws Exception {
        log.info("ItemController/createForm() 실행");
        List<Category> categoryList = categoryService.listAll();
        model.addAttribute("categoryList", categoryList);
        return "/store/item/createForm";
    }

    @ResponseBody
    @RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(HttpSession session, MultipartFile[] uploadFiles, Item item, Model model) throws IOException { // uploadFile : ajax를 호출한 javascript 함수 ( 자동 매핑 )
        log.info("UploadController/uploadAjax() 실행");

//        if(uploadFiles == null) { // 파일이 없을 경우 에러 발생
//            log.info("file is null");
//            return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
//        }

        User user = (User)session.getAttribute("member");

        ItemDto itemDto = ItemDto.of(user, item);
        itemService.create(itemDto); // item 테이블에 데이터 저장

        try {
            ItemImgDto itemImgDto = ItemImgDto.of(uploadFiles, user);
            itemImgService.upload(itemImgDto); // 파일 저장,
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>("upload success", HttpStatus.OK);
    }

}
