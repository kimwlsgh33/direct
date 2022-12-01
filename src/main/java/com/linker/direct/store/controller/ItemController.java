package com.linker.direct.store.controller;

// entity
import com.linker.direct.user.entity.User;
import com.linker.direct.store.entity.Category;
// dto
import com.linker.direct.store.dto.ItemFormDto;
// service
import com.linker.direct.store.service.CategoryService;
import com.linker.direct.store.service.ItemService;
// lombok
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// springframework
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
// java
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

    @RequestMapping("/createForm")
    public String createForm(Model model) throws Exception {
        List<Category> categoryList = categoryService.listAll();
        model.addAttribute("categoryList", categoryList);
        return "/store/item/createForm";
    }

    @ResponseBody
    @RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(List<MultipartFile> uploadFiles, ItemFormDto itemFormDto, Model model) throws Exception { // uploadFile : ajax를 호출한 javascript 함수 ( 자동 매핑 )

        //==================================================================================================
        // 로그인 여부 확인 ==================================================================================================
        //==================================================================================================
        // User user = (User)session.getAttribute("user");
        User user = new User();
        user.setId(1);
        if(user == null) {
            log.info("로그인이 필요합니다.");
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        itemFormDto.setCreateBy(user.getId()); // 생성자 id : 로그인한 사용자 id
        //==================================================================================================
        // 사진 정보 확인 ==================================================================================================
        //==================================================================================================
        if(uploadFiles == null) { // 파일이 없을 경우 에러 발생
            log.info("file is null", uploadFiles);
            return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
        }

        //==================================================================================================
        // item 저장 ==================================================================================================
        //==================================================================================================
        itemService.create(itemFormDto, uploadFiles); // item 테이블에 저장

        return new ResponseEntity<>("upload success", HttpStatus.OK);
    }
}
