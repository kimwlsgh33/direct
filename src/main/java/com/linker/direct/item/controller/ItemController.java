package com.linker.direct.item.controller;

// entity
import com.linker.direct.item.dto.ItemFormDto;
import com.linker.direct.item.service.ItemService;
import com.linker.direct.member.vo.MemberVO;
import com.linker.direct.category.CategoryVO;
// dto
// service
import com.linker.direct.category.CategoryService;
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
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {
    private final ItemService itemService;
    private final CategoryService categoryService;

    @RequestMapping("/createForm")
    public String createForm(Model model) throws Exception {
        List<CategoryVO> categoryVOList = categoryService.listAll();
        model.addAttribute("categoryList", categoryVOList);
        return "/item/create";
    }

    @ResponseBody
    @RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(List<MultipartFile> uploadFiles, ItemFormDto itemFormDto, Model model, HttpServletRequest request) throws Exception { // uploadFile : ajax를 호출한 javascript 함수 ( 자동 매핑 )

        //==================================================================================================
        // 로그인 여부 확인 ==================================================================================================
        //==================================================================================================
        MemberVO memberVO = (MemberVO) request.getSession().getAttribute("user");
        if(memberVO == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        //==================================================================================================
        itemFormDto.setUser_id(memberVO.getUser_id()); // 생성자 id : 로그인한 사용자 id
        //==================================================================================================
        // 사진 정보 확인 ==================================================================================================
        //==================================================================================================
        if(uploadFiles == null) { // 파일이 없을 경우 에러 발생
            return new ResponseEntity<>("fail_no_img", HttpStatus.BAD_REQUEST);
        }

        //==================================================================================================
        // item 저장 ==================================================================================================
        //==================================================================================================
        itemService.create(itemFormDto, uploadFiles); // item 테이블에 저장

        return new ResponseEntity<>("upload success", HttpStatus.OK);
    }


}
