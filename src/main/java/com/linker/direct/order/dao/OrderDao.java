package com.linker.direct.order.dao;

import com.linker.direct.order.vo.OrderVO;
import org.springframework.dao.DataAccessException;

public interface OrderDao {
    void create(OrderVO orderVO) throws DataAccessException;
}
