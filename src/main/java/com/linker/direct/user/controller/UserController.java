package com.linker.direct.user.controller;

import com.linker.direct.user.service.UserService;
import com.linker.direct.user.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @RequestMapping("/login")
    public String login(Model model, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        try {
            User user = userService.login();
            if(user != null) {
                session.setAttribute("user", user);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        // String referer = request.getHeader("Referer");
        // request.getSession().setAttribute("prevPage", referer);
        // 위의 코드는 로그인 후 이전 페이지로 돌아가기 위한 코드입니다.
        return "redirect:/";
    }
}
