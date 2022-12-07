package com.linker.direct.user.service;

import com.linker.direct.user.dao.UserDao;
import com.linker.direct.user.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserDao userDao;

    @Override
    public User login() throws Exception {
        return userDao.login();
    }
}
