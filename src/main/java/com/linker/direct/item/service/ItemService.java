package com.linker.direct.item.service;


import com.linker.direct.item.dto.ItemFormDto;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDto itemFormDto, List<MultipartFile> uploadFiles) throws Exception;

    ItemVO read(ItemVO itemVO) throws Exception;
}
