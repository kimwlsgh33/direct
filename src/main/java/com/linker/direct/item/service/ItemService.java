package com.linker.direct.item.service;


import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.dto.ItemRecommDTO;
import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDTO itemFormDto, List<MultipartFile> uploadFiles, ItemOptionVO itemOptionVO) throws Exception;

    ItemDTO read(ItemVO itemVO) throws Exception;
    List<ItemDTO> searchListPaging(SearchCriteria cri) throws Exception;
    int totalCount(SearchCriteria cri) throws Exception;
    List<ItemVO> searchListAll(SearchCriteria cri) throws Exception;

    List<ItemRecommDTO> recommendList() throws Exception;
}
