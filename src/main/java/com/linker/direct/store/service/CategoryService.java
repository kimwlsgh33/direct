package com.linker.direct.store.service;

import com.linker.direct.store.entity.Category;

import java.util.List;

public interface CategoryService {
  List<Category> listAll() throws Exception;

  void create(Category category) throws Exception;

  Category read(int id) throws Exception;

  void update(Category category) throws Exception;

  void delete(int id) throws Exception;
}
