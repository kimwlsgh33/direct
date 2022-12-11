package com.linker.direct.order.dao;

import com.linker.direct.order.vo.Order;
import org.springframework.dao.DataAccessException;

public interface OrderDao {
    void create(Order order) throws DataAccessException;
}
