package com.linker.direct.member.service;

import com.linker.direct.member.dao.MemberDAO;
import com.linker.direct.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberDAO memberDAO;

    @Override
    public MemberVO login() throws Exception {
        return memberDAO.login();
    }
}
