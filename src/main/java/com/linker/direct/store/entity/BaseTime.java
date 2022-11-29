package com.linker.direct.store.entity;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter @Setter
public abstract class BaseTime {
    private LocalDateTime createdAt; // 생성 시간 - 불변
    private LocalDateTime updatedAt; // 수정 시간
}
