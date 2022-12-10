package com.linker.direct.category;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDto {
    private int id;

    public Category toVo() {
        return new Category(Long.valueOf(id), null, null, null);
    }
}
