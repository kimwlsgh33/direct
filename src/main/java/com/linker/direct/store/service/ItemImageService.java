package com.linker.direct.store.service;

import com.linker.direct.store.dao.ItemImageDao;
import com.linker.direct.store.entity.ItemImg;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor // 생성자 주입
public class ItemImageService {
    private String itemImgLocation;

    private final ItemImageDao itemImageDao;
    private final FileService fileService;

    public void saveItemImage(ItemImg itemImg, MultipartFile itemImgFile) throws Exception {
        String originName = itemImgFile.getOriginalFilename();
        String imgName = "";
        String imgUrl = "";

        // 파일 업로드
        if (originName != null && !originName.equals("")) { // !StringUtils.isEmpty(originName)
            imgName = fileService.uploadFile(itemImgLocation, originName, itemImgFile.getBytes());
            imgUrl = "/images/item/" + imgName;
        }

        // 상품 이미지 객체 업데이트
        itemImg.updateItemImg(originName, imgName, imgUrl);
        // 상품 이미지 저장
        itemImageDao.save(itemImg);
    }

    // 상품 이미지 변경
    public void updateItemImage(String itemImgId, MultipartFile itemImgFile) throws Exception {
        if(!itemImgFile.isEmpty()) {
            // 기존 이미지 정보 불러옴 - DB
            ItemImg savedItemImg = itemImageDao.findById(itemImgId);

            // 기존 이미지 삭제
            if(savedItemImg.getImgName() != null && !savedItemImg.getImgName().equals("")) {
                fileService.deleteFile(itemImgLocation + "/" + savedItemImg.getImgName());
            }


            String originName = itemImgFile.getOriginalFilename();
            String imgName = fileService.uploadFile(itemImgLocation, originName, itemImgFile.getBytes());
            String imgUrl = "/images/item/" + imgName;
            savedItemImg.updateItemImg(originName, imgName, imgUrl);
        }
    }
}
