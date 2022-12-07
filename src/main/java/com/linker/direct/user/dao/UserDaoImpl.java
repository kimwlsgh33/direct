package com.linker.direct.user.dao;

import com.linker.direct.user.vo.User;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {

    private static final String NAMESPACE = "com.linker.direct.user.dao.UserDao.";
    private final SqlSession sqlSession;

    @Override
    public User login() throws Exception {
        // TODO: parameter에 id 넣어주기
        return sqlSession.selectOne(NAMESPACE + "readById",1L);
    }
}
