package com.linker.direct.common.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//==================================================================================================
// SearchCriteria
// - 검색 조건을 담는 클래스
//==================================================================================================
@Getter @Setter @ToString
public class SearchCriteria extends Criteria{
    private String keyword; // 검색 키워드
    private String subFilter; // 검색 필터
    private String searchListAll; // 검색 리스트 전체
}
