package com.linker.direct.store.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter
@EqualsAndHashCode
public class Category {
  private String categoryId;
  private String categoryName;

  public Category(String categoryId, String categoryName) {
    this.categoryId = categoryId;
    this.categoryName = categoryName;
  }
}
