package com.linker.direct.store.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter
@EqualsAndHashCode // 값 비교를 위한 메소드 오버라이딩
public class Money {
    private final int value;

    public Money(int value) {
        this.value = value;
    }

    public int getHalf() {
        return value / 2;
    }
}
