package com.linker.direct.store.entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter
@EqualsAndHashCode // 불변 객체
public class Item {
  private String id;
  private String name;
  private int price;
  private int stockQuantity;
  private String description;
  private String categoryId;

  public Item(String id, String name, int price, int stockQuantity, String description, String categoryId) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.stockQuantity = stockQuantity;
    this.description = description;
    this.categoryId = categoryId;
  }
}
