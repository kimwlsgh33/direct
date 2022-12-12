package com.linker.direct.admin;

import com.linker.direct.item.service.ItemOptionService;
import com.linker.direct.item.vo.ItemOptionVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
        private final ItemOptionService itemOptionService;

        @RequestMapping("")
        public void index(){}

        @RequestMapping("/store")
        public void adminStore(){} // void return : /admin/store.jsp ( 메소드 이름 X )

        @RequestMapping("/test")
        public String test() {
            return "admin/test";
        }

        @RequestMapping("/test/createOptionForm")
        public String createOptionForm(Model model) throws Exception {
                ItemOptionVO itemOptionVO = new ItemOptionVO();
                itemOptionVO.setItem_id(1L);
                itemOptionVO.setOption("옵션1");
                itemOptionVO.setDescription("test");
                itemOptionVO.setPrice(1000);
                itemOptionService.create(itemOptionVO);
                return "admin/test/create";
        }
        @RequestMapping("/test/createOption")
        public String createOption(ItemOptionVO itemOptionVO) throws Exception {
                itemOptionService.create(itemOptionVO);
                return "admin/test/list";
        }
}

/**
 * Foreign Key로 연결된 테이블의 데이터를 삭제할 때
 * 1. 외래키 제약조건을 먼저 삭제
 * 2. 데이터 삭제
 *
 * 데이터를 넣는 방법
 */
