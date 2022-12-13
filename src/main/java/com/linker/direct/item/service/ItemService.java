package com.linker.direct.item.service;


import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDTO itemFormDto, List<MultipartFile> uploadFiles) throws Exception;

    ItemDTO read(ItemVO itemVO) throws Exception;
    List<ItemVO> searchListPaging(SearchCriteria cri) throws Exception;
    int totalCount(SearchCriteria cri) throws Exception;
    public List<ItemVO> searchListAll(SearchCriteria cri) throws Exception;

}
