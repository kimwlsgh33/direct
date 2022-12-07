package com.linker.direct.user.dao;

import com.linker.direct.user.vo.User;

public interface UserDao {
    User login() throws Exception;
}
