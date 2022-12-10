package com.linker.direct.store;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@EqualsAndHashCode
public class StoreDto {
    private Long store_id;

    public Store toVo() {
        Store store = new Store();
        store.setStore_id(store_id);
        return store;
    }
}
