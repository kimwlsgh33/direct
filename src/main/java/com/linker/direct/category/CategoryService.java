package com.linker.direct.category;

import java.util.List;

public interface CategoryService {
  List<CategoryVO> listAll() throws Exception;

  void create(CategoryVO categoryVO) throws Exception;

  CategoryVO read(CategoryDto categoryDto) throws Exception;

  void update(CategoryVO categoryVO) throws Exception;

  void delete(CategoryDto categoryDto) throws Exception;
}
