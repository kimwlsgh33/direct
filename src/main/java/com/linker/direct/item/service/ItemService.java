package com.linker.direct.item.service;


import com.linker.direct.item.dto.ItemFormDTO;
import com.linker.direct.item.vo.ItemVO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {
    void create(ItemFormDTO itemFormDto, List<MultipartFile> uploadFiles) throws Exception;

    ItemVO read(ItemVO itemVO) throws Exception;
}
