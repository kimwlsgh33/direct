package com.linker.direct.item.service;

// dao
// dto
// entity
// lombok
import com.linker.direct.item.dto.ItemImgReadDTO;
import com.linker.direct.item.vo.ItemImgVO;
import com.linker.direct.item.dao.ItemImgDAO;
import com.linker.direct.item.dto.ItemImgSaveDTO;
import com.linker.direct.item.vo.ItemVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// springframework
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Base64;
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
    private final ItemImgDAO itemImgDao;


    //==================================================================================================
    // 상품 이미지 업로드
    //==================================================================================================
    public void upload(ItemImgSaveDTO itemImgSaveDto) throws Exception {
        log.info("업로드 경로 : " + uploadPath);

        MultipartFile uploadFile = itemImgSaveDto.getUploadFile();

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
        ItemImgVO itemImgVO = new ItemImgVO();
        itemImgVO.updateItemImg(itemImgSaveDto.getItemVO().getItem_id(), uuid, originName);

        itemImgDao.create(itemImgVO);
    }


    //==================================================================================================
    // 상품 이미지 조회
    //==================================================================================================
    @Override
    public List<ItemImgReadDTO> readByItem(ItemVO itemVO) throws Exception {
        // DB 조회
        List<ItemImgVO> itemImgList = itemImgDao.readByItem(itemVO);
        // 실제 이미지 조회
        return getItemsImgList(itemImgList);
    }

    //==================================================================================================
    // 상품 이미지 목록 받아서, 실제 이미지 파일 조회
    //==================================================================================================
    private List<ItemImgReadDTO> getItemsImgList(List<ItemImgVO> itemImgList) throws Exception {
        List<ItemImgReadDTO> itemImgReadList = new ArrayList<ItemImgReadDTO>();
        for (ItemImgVO itemImgVO : itemImgList) {
            String originName = itemImgVO.getOrigin_name();
            String readImgFileUrl = readImgFileUrl(itemImgVO.getImg_name());
            ItemImgReadDTO itemImgReadDTO = ItemImgReadDTO.of(originName, readImgFileUrl);
            itemImgReadList.add(itemImgReadDTO);
        }
        return itemImgReadList;
    }

    //==================================================================================================
    // 실제 이미지 파일 base64 URL 가져오기
    //==================================================================================================
    public String readImgFileUrl(String img_name) throws Exception {
        String separator = File.separator; // 윈도우는 \, 리눅스는 /를 사용한다.
        String fileUrl = uploadPath + separator + img_name;
        return "data:image/png;base64," + Base64.getEncoder().encodeToString(FileCopyUtils.copyToByteArray(new File(fileUrl)));

        // Base64 : 바이너리 데이터를 텍스트로 인코딩하는 방식
        // Base64.getEncoder().encodeToString() : 바이너리 데이터를 인코딩한다.
        // FileCopyUtils.copyToByteArray() : 파일을 바이너리 데이터로 복사한다.
    }
}

/**
 * 스트림(stream)이란?
 * 1. 데이터를 연속적으로 처리할 수 있도록 연결한 통로
 * 2. 데이터를 읽어 들이는 입력 스트림과, 데이터를 출력하는 출력 스트림으로 나뉜다.
 * 3. 스트림은 데이터를 1byte씩 처리한다.
 */