package com.linker.direct.category;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {
    private int id;

    public CategoryVO toVo() {
        CategoryVO categoryVO = new CategoryVO();
        categoryVO.setCategory_id(Long.valueOf(id));
        return categoryVO;
    }
}
