package com.linker.direct.store.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Data
@Component
public class Category {
  private int id;
  private String name;
  private String icon;
  private String color;
}
