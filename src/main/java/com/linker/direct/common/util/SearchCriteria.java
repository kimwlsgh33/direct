package com.linker.direct.common.util;

public class SearchCriteria extends Criteria{

    private String keyword;
    private String subFilter;

    private String searchListAll;


    public String getKeyword() {
        return keyword;
    }

    public String getSearchListAll() {
        return searchListAll;
    }

    public String getSubFilter() {
        return subFilter;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setSearchListAll(String searchListAll) {
        this.searchListAll = searchListAll;
    }

    public void setSubFilter(String subFilter) {
        this.subFilter = subFilter;
    }

    @Override
    public String toString() {
        return "SearchCriteria [keyword=" + keyword + "]";
    }

}
