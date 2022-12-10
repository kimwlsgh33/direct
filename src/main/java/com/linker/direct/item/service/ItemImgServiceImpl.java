package com.linker.direct.item.service;

// dao
// dto
// entity
// lombok
import com.linker.direct.item.vo.ItemImg;
import com.linker.direct.item.dao.ItemImgDao;
import com.linker.direct.item.dto.ItemImgDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// springframework
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class ItemImgServiceImpl implements ItemImgService {
    // servlet-context.xml에 설정된 uploadPath를 가져온다.
//    @Resource(name="uploadPath")
    @Value("${uploadPath}")
    private String uploadPath;
    private final ItemImgDao itemImgDao;


    // uuid 이용해, 파일 저장하기
    public void upload(ItemImgDto itemImgDto) throws Exception {
        log.info("업로드 경로 : " + uploadPath);

        MultipartFile uploadFile = itemImgDto.getUploadFile();

        String originName = uploadFile.getOriginalFilename();
        byte[] fileData = uploadFile.getBytes();

        String extension = originName.substring(originName.lastIndexOf("."));
        //==================================================================================================
        // uuid 생성 [ uuid.ext ] ==================================================================================================
        //==================================================================================================
        String uuid = UUID.randomUUID().toString() + extension;

        //==================================================================================================
        // 파일 저장 ==================================================================================================
        //==================================================================================================
        File target = new File(uploadPath, uuid); // 파일 저장 경로
        FileCopyUtils.copy(fileData, target); // FileCopyUtils : 스프링에서 제공하는 파일 복사 클래스
        //================================================================================================
        // DB에 저장 =================================================================================================
        //================================================================================================
        ItemImg itemImg = new ItemImg();
        itemImg.updateItemImg(uuid, originName, itemImgDto.getItem().getItem_id());

        itemImgDao.create(itemImg);
    }

    @Override
    public List<ItemImg> read(int id) throws Exception {
        return itemImgDao.readItemImgs(id);
    }
}

/**
 * 스트림(stream)이란?
 * 1. 데이터를 연속적으로 처리할 수 있도록 연결한 통로
 * 2. 데이터를 읽어 들이는 입력 스트림과, 데이터를 출력하는 출력 스트림으로 나뉜다.
 * 3. 스트림은 데이터를 1byte씩 처리한다.
 */