package com.linker.direct.store.dao;

import com.linker.direct.store.entity.Item;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ItemDao {
  List<Item> listAll() throws DataAccessException;
  void create(Item item) throws DataAccessException;

  Item read(String id) throws DataAccessException;

  void update(Item item) throws DataAccessException;

  void delete(String id) throws DataAccessException;
}
