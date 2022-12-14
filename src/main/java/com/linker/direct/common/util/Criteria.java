package com.linker.direct.common.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // Criteria ( 한 페이지에 보여줄 상품의 개수, 현재 페이지 번호 )
    private int page;
    private int perPageNum;

    public Criteria() {
        this.page = 1;
        this.perPageNum = 12;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
        } else {
            this.perPageNum = perPageNum;
        }
    }

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
    }
}


