package com.linker.direct.store.entity;

import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.dto.ItemFormDto;
import com.linker.direct.store.exception.OutOfStockException;
import lombok.*;

// DB - item
@Getter
@Setter
@ToString
@EqualsAndHashCode // 불변 객체
public class Item extends Base{
  private Integer id; // 상품 코드
  @NonNull
  private String name;
  @NonNull
  private int price;
  @NonNull
  private int stock;
  @NonNull
  private String description;

  // String
  private ItemSellStatus status; // 상품 판매 상태
  private Integer category_id;
  private Integer createBy;

//  public updateItem(String id, String name, int price, int stockQuantity, String description, String categoryId) {
  public void updateItem(ItemFormDto itemFormDto) { // 아이템 상태 업데이트
    this.id = itemFormDto.getId();
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
