package com.linker.direct.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect // 해당 클래스 자체가 Aspect 역할을 수행
@Component // 해당 클래스를 Bean으로 등록
public class ColorLogAdvice {
    private static Logger logger = LoggerFactory.getLogger(ColorLogAdvice.class);
    private final String SPHAIR = "========================================";

    public String coloring(String str, AopType aopType) {
        String color = "";
        if(aopType.equals(AopType.BEFORE)) {
            color = LogColor.BLUE.getColor();
        } else if(aopType.equals(AopType.AFTER)) {
            color = LogColor.GREEN.getColor();
        } else if(aopType.equals(AopType.AROUND)) {
            color = LogColor.PURPLE.getColor();
        }
        return color + str + LogColor.RESET.getColor();
    }
    public void defaultLogging(String str, AopType aopType) {
//        logger.info(coloring(SPHAIR, aopType));
        logger.info(SPHAIR);
        logger.info(coloring("=============[AOP " + aopType + "]==============", aopType));
        logger.info(coloring(str, aopType));
        logger.info(coloring(SPHAIR, aopType));
    }

    // Advice : 어떤 특정한 시점에 실행되는 코드
    // @Before : 메서드 실행 전에 실행되는 코드
    // @After : 메서드 실행 후에 실행되는 코드
    // @AfterReturning : 메서드가 정상적으로 실행된 후에 실행되는 코드
    // @AfterThrowing : 메서드가 예외를 던진 후에 실행되는 코드
    // @Around : 메서드 실행 전후에 실행되는 코드

    // execution : 특정 메서드를 지정
    // * : 모든 메서드를 의미
    // .. : 0개 이상의 파라미터를 의미
    // * test(..) : test라는 이름의 모든 메서드를 의미
    // 첫번째 * : 리턴 타입을 의미
    // 두번째 * : 모든 클래스를 의미
    // 세번째 * : 모든 메서드를 의미
    @Before("execution(* com.linker.direct..*.*(..))")
    public void before(JoinPoint jp) { // JoinPoint : Advice가 적용된 메서드의 정보를 가지고 있는 객체
        defaultLogging(jp.getSignature().toString(), AopType.BEFORE);
    }

//    @Around("execution(* *..controller.*.*(..)) || execution(* *..service.*.*(..)) || execution(* *..dao.*.*(..))")
//    public Object around(ProceedingJoinPoint pjp) { // ProceedingJoinPoint : JoinPoint를 상속받은 인터페이스로, 메서드 실행을 제어할 수 있는 기능을 가지고 있음
//        defaultLogging(pjp.getSignature().toString(), AopType.AROUND);
//        StopWatch stopWatch = new StopWatch();
//        stopWatch.start();
//
//        Object result = null;
//        try {
//            result = pjp.proceed(); // 메서드 실행
//        } catch (Throwable e) {
//            e.printStackTrace();
//        }
//
//        stopWatch.stop();
//        long totalTime = stopWatch.getTotalTimeMillis();
//        String className = pjp.getTarget().getClass().getName();
//        String methodName = pjp.getSignature().getName();
//        defaultLogging( className + "." + methodName + "() 실행 시간 : " + totalTime + "(ms)", AopType.AROUND);
//        return result;
//    }

}
