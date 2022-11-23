package com.linker.direct.searchResult.dto;

import lombok.Data;
import org.springframework.stereotype.Component;
import scala.Int;

import java.sql.Date;

@Component("srDTO")
@Data
public class SRDTO {
    private String product_num;  //제품 번호
    private String product_name; // 제품 이름
    private String product_price; // 제품 가격
    private String product_image; // 제품 이미지
    private Int click_count; // 조회수
    private String product_description; // 제품 설명
    private String product_brand; // 제품 브랜드
    private String product_stock; // 제품 재고
    private Date product_date; // 올린 날짜
}
