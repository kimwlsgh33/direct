package com.linker.direct.common.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {







  // redirect: 특정한 조건에 만족하지 않으면 특정 페이지로 이동하는 것.
    // => 회원 관련 페이지에사 로그인이 되어 있지 않다면 메인 페이지 또는 로그인 페이지로 이동시킨다.
    // *Controller 에서는 매 요청이 올 때마다 로그인을 체크하고 redirect를 하는 것은 효율적이지 못하다.
    // 이처럼 redirect를 하는 경우가 많을 때 인터셉터. 명확하게는 HandlerInterceptor를 이용.

    //HandlerInterceptor는 interface로 3가지 method()를 포함하고 있다.
    //preHandle() : 컨트롤러 실행 전에 실행되는 메소드
    // preHandle의 return은 boolean으로 true이면 컨트롤러를 실행하고 false이면 실행하지 않는다.
    //postHandle() : 컨트롤러 실행 후에 실행되는 메소드
    //afterCompletion() : 뷰 실행 후에 실행되는 메소드

    // 기존에 클라이언트의 요청이 작동되던 순서
    // Request => DispatcherServlet => Controller => (ViewResolver) => View => (DispatcherServlet) => Response
    // 인터셉터를 적용했을 때 요청이 작동되는 순서 (해당 interface에 있는 3가지 메서드를 모두 적용시킨다는 가정하에)
    // Request => DispatcherServlet => preHandle() => Controller => postHandle() => (ViewResolver) => View => afterCompletion() => (DispatcherServlet) => Response



}
