package com.linker.direct.common.aop;

import lombok.extern.java.Log;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// @Aspect: 해당 클래스 객체가 Aspect를 구현한 것임을 나타내기 위해서 사용.
// Aspect: 흩어진 관심사를 모듈화 한 것. 부가기능을 모듈화
// @Component: 해당 클래스 객체를 스프링에서 관리하기 위해서 사용. aop와 직접적인 관계는 없지만 스프링에서 Bean으로 인식시키기 위해 사용

@Aspect
@Component
@Log
public class LogAdvice {
    private static final org.slf4j.Logger logger = LoggerFactory.getLogger(LogAdvice.class);

    @Before("execution(* com.linker.direct.search.service.*.*(..))")
    public void beforeComponentMethod(JoinPoint jp) {
        logger.info("------------------------------------------------------------------------");
        logger.info("LogAdvice beforeComponentMethod() 실행 전 로그" + jp.getSignature());

    }


    // Advice: 부가기능을 담은 클래스
    // @Before: 타겟 메서드가 실행되기 전 어드바이스 기능을 수행.
    // @After: 메서드가 실행된 후에 실행되는 부가기능을 구현하기 위해서 사용
    // @AfterReturning: 메서드가 정상적으로 실행된 후에 실행되는 부가기능을 구현하기 위해서 사용
    // @AfterThrowing: 타겟 메서드가 수행 중 예외를 발생시킨 후에 실행되는 부가기능을 구현하기 위해서 사용
    // @Around: 메서드가 실행되기 전과 후에 실행되는 부가기능을 구현하기 위해서 사용
    // execution(int minus(int, int) : int 타입의 minus메서드, 두개의 int 파라미터를 가지는 메서드
    // execution(* minus(..)) : minus로 시작하는
    // //execution(* minus(): 리턴 타입은 상관없이 조재하지 않는 minus 메서드

//    @Around("excution( * com.aeu.app.service.AppSerivice.")

    // @Pointcut: 공통적으로 사용되는 Pointcut을 지정하기 위해서 사용
    // Pointcut: Advice가 적용되는 위치를 지정하는 것
    // execution: 특정 메서드를 지정하기 위해서 사용
    // *: 모든 값을 의미
    // ..: 0개 이상의 값을 의미
    // * com.linker.direct..*.*(..): com.linker.direct 패키지와 그 하위 패키지에 속한 모든 클래스의 모든 메서드를 의미
}
