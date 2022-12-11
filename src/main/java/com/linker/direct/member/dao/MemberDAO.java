package com.linker.direct.member.dao;

import com.linker.direct.member.vo.MemberVO;

public interface MemberDAO {
    MemberVO login() throws Exception;
}
