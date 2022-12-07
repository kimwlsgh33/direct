package com.linker.direct.store.vo;

import com.linker.direct.common.Base;
import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.dto.ItemFormDto;
import com.linker.direct.store.exception.OutOfStockException;
import lombok.*;

// DB - item
@Getter
@Setter
@ToString
@EqualsAndHashCode // 불변 객체
public class Item extends Base {
  private Long item_id; // 구분자

  private Long store_id; // 상점 연결
  private String name;
  private int price;
  private int stock;
  private String description;

  private ItemSellStatus status; // 상품 판매 상태
  private Long category_id; // 카테고리 연결
  public Item(){ super(); }
  public Item(Long item_id, Long store_id, String name, int price, int stock, String description, ItemSellStatus status, Long category_id) {
    super();
    this.item_id = item_id;
    this.store_id = store_id;
    this.name = name;
    this.price = price;
    this.stock = stock;
    this.description = description;
    this.status = status;
    this.category_id = category_id;
  }

//  public updateItem(String id, String name, int price, int stockQuantity, String description, String categoryId) {
  public void updateItem(ItemFormDto itemFormDto) { // 아이템 상태 업데이트
    this.item_id = itemFormDto.getItem_id();
    this.name = itemFormDto.getItemName();
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
