package com.linker.direct.searchResult.dao;

import com.linker.direct.searchResult.dto.SRDTO;

import java.util.List;

public interface SRDAO {
    public List<SRDTO> ProductList() throws Exception;

    // 게시글 조회수 증가
    public void updateClickCount(int seq);

    // 게시글 상세보기
    public SRDTO ProductDetail(int seq);

    // 게시글 삭제
    public int ProductDelete(int seq);

    // 게시글 수정
    public int ProductUpdate(SRDTO srDTO);

    // 게시글 등록
    public int ProductRegister(SRDTO srDTO);

}
