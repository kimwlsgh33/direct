package com.linker.direct.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
        @RequestMapping("")
        public void index(){}

        @RequestMapping("/store")
        public void adminStore(){} // void return : /admin/store.jsp ( 메소드 이름 X )

        @RequestMapping("/test")
        public String test() {
            return "admin/test";
        }
}

/**
 * Foreign Key로 연결된 테이블의 데이터를 삭제할 때
 * 1. 외래키 제약조건을 먼저 삭제
 * 2. 데이터 삭제
 *
 * 데이터를 넣는 방법
 */
