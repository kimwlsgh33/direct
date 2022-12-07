package com.linker.direct.store.dto;

import com.linker.direct.store.vo.Category;
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
