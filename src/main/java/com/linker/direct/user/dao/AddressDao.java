package com.linker.direct.user.dao;

import org.springframework.dao.DataAccessException;

import java.util.List;

public interface AddressDao {
    List<Address> listAll(int user_id) throws DataAccessException;
}
