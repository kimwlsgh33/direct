package com.linker.direct.item.vo;

import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.ItemSellStatus;
import com.linker.direct.item.OutOfStockException;
import lombok.*;

import java.sql.Timestamp;

// DB - item
@Data
public class ItemVO {
  private Long item_id; // 구분자
  private Long user_id; // 판매자
  private String name;
  private int price;
  private int stock;
  private String description;
  private ItemSellStatus status; // 상품 판매 상태
  private Timestamp created_at;
  private Timestamp updated_at;
  private Long category_id; // 카테고리 연결
  public ItemVO(){}
  public void updateItem(ItemFormDTO itemFormDto) { // 아이템 상태 업데이트
    this.item_id = itemFormDto.getItem_id();
    this.user_id = itemFormDto.getUser_id();
    this.name = itemFormDto.getName();
    this.price = itemFormDto.getPrice();
    this.stock = itemFormDto.getStock();
    this.description = itemFormDto.getDescription();
    this.category_id = itemFormDto.getCategory_id();
  }

  public void removeStock(int stock){ // 아이템 판매로, 개수 차감
    int restStock = this.stock - stock;
    if(restStock < 0){
      throw new OutOfStockException("상품의 재고가 부족합니다. (재고 수량 : " + stock + ")");
    }
    this.stock = restStock;
  }

  public void addStock(int stock){ // 아이템 재입고, 개수 추가
    this.stock += stock;
  }

}
