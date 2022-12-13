package com.linker.direct.category;

import com.linker.direct.item.vo.ItemVO;

import java.util.List;

public interface CategoryService {
  List<CategoryVO> listAll() throws Exception;

  void create(CategoryVO categoryVO) throws Exception;

  CategoryVO read(CategoryDTO categoryDto) throws Exception;

  void update(CategoryVO categoryVO) throws Exception;

  void delete(CategoryDTO categoryDto) throws Exception;

    CategoryVO readByItem(ItemVO itemVO) throws Exception;
}
