package com.linker.direct.store.service;

import com.linker.direct.store.dto.CategoryDto;
import com.linker.direct.store.vo.Category;

import java.util.List;

public interface CategoryService {
  List<Category> listAll() throws Exception;

  void create(Category category) throws Exception;

  Category read(CategoryDto categoryDto) throws Exception;

  void update(Category category) throws Exception;

  void delete(CategoryDto categoryDto) throws Exception;
}
