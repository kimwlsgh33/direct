package com.linker.direct.item;

// Runtime Exception : 개발자가 처리할 수 없는 예외
// 가독성을 위해, 사용자 정의 예외를 만들어서 사용
public class OutOfStockException extends RuntimeException {
    public OutOfStockException(String message) {
        super(message);
    }
}
