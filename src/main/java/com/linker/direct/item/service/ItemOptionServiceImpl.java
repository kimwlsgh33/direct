package com.linker.direct.item.service;

import com.linker.direct.item.dao.ItemOptionDAO;
import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ItemOptionServiceImpl implements ItemOptionService {
    private final ItemOptionDAO itemOptionDAO;

    @Override
    public void create(ItemOptionVO itemOptionVO) throws Exception {
        itemOptionDAO.create(itemOptionVO);
    }

    @Override
    public ItemOptionVO read(ItemOptionVO itemOptionVO) throws Exception {
        return itemOptionDAO.read(itemOptionVO);
    }
    
//    @Override
//    public ItemOptionVO readByItem(ItemVO itemVO) throws Exception {
//    	return itemOptionDAO.readByItem(itemVO);
//    }
}
