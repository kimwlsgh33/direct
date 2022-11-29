package com.linker.direct.store.service;

import com.linker.direct.store.constant.ItemSellStatus;
import com.linker.direct.store.dao.ItemDao;
import com.linker.direct.store.dto.ItemDto;
import com.linker.direct.store.entity.Item;
import com.linker.direct.user.entity.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {
    private final ItemDao itemDao;

    @Override
    public void create(ItemDto itemDto) {

        Item item = itemDto.getItem();
        User user = itemDto.getUser();
        item.setStatus(ItemSellStatus.SELLING); // 판매 상태 : 판매중
        item.setCreateBy(1); // 생성자 id : 1
//        item.setCreateBy(user.getId()); // 생성자 id : 로그인한 사용자 id
        itemDao.create(item);
    }
}
