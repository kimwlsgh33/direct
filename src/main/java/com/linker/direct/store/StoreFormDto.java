package com.linker.direct.store;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter @Setter @ToString
@EqualsAndHashCode
public class StoreFormDto {
    private int store_id;
    private String name;
    private String address;
    private String store_img_url;
    private String phone;
    private String introduce;
    private String business_hour;
    private String holiday;
    private String category_id;

    public Store toVo() {
        Store store = new Store();
        store.setStore_id(Long.valueOf(store_id));
        store.setName(name);
        store.setAddress(address);
        store.setStore_img_url(store_img_url);
        store.setPhone(phone);
        store.setIntroduce(introduce);
        store.setBusiness_hour(business_hour);
        store.setHoliday(holiday);
        store.setCategory_id(Long.valueOf(category_id));
        return store;
    }
}
