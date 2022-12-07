package com.linker.direct.common;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter @Setter
public class Base {
    private Timestamp created_at; // 생성 시간 - 불변
    private Timestamp updated_at; // 수정 시간
}
