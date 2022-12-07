package com.linker.direct.store.vo;

import lombok.Getter;

// VO 기본 형식
@Getter
public class Store {
    private String id;
    private String name;

    public Store(String id, String name) {
        this.id = id;
        this.name = name;
    }
}