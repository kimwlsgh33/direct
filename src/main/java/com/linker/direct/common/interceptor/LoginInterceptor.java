package com.linker.direct.common.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// HandlerInterceptorAdapter : 스프링에서 제공하는 인터셉터 클래스 - preHandle, postHandle, afterCompletion 메서드를 오버라이딩해서 사용
@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

    // preHandle : 컨트롤러 실행 전에 실행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(); // 세션 객체 생성
        if (session.getAttribute("user") == null) { // 세션에 user 객체가 없으면
            log.info("====== Interceptor : 로그인이 필요합니다. ======");
            response.sendRedirect("/user/login"); // 로그인 페이지로 이동
            return false;
        }
        return true; // 세션에 user 객체가 있으면, 컨트롤러로 이동
    }
}

/**
 * Request => DispatcherServlet => HandlerMapping => Controller => ViewResolver => View => DispatcherServlet => Response
 * Request => DispatcherServlet => HandlerMapping => preHandle => Controller => postHandle => ViewResolver => View => afterCompletion => DispatcherServlet => Response
 */