package com.linker.direct.category;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;


@Getter @ToString
@EqualsAndHashCode
public class Category {
  private Long category_id;
  private String name;
  private String icon;
  private String color;

    public Category(Long category_id, String name, String icon, String color) {
        this.category_id = category_id;
        this.name = name;
        this.icon = icon;
        this.color = color;
    }
}
