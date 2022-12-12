package com.linker.direct.member.dao;

import com.linker.direct.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemberDAOImpl implements MemberDAO {

    private static final String NAMESPACE = "com.linker.direct.user.dao.UserDao.";
    private final SqlSession sqlSession;

    @Override
    public MemberVO login() throws Exception {
        // TODO: parameter에 id 넣어주기
        return sqlSession.selectOne(NAMESPACE + "readById",1L);
    }
}
