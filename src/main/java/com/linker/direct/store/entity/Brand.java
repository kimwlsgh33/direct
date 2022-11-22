package com.linker.direct.store.entity;

import lombok.Getter;

// VO 기본 형식
@Getter
public class Brand {
    private String id;
    private String name;

    public Brand(String id, String name) {
        this.id = id;
        this.name = name;
    }
}