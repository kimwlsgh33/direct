package com.linker.direct.item.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

@Slf4j
@Service
public class FileService {
    // 서버에 파일 저장하고, 저장된 파일의 이름을 반환
    public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
        UUID uuid = UUID.randomUUID();
        String extension = originalName.substring(originalName.lastIndexOf("."));

        String savedName = uuid.toString() + extension; // uuid.확장자

        String fullPath = uploadPath + "/" + savedName; // 저장경로/uuid.확장자

        // FileOutputStream : 파일에 바이트 단위로 쓰기
        FileOutputStream fos = new FileOutputStream(fullPath);
        fos.write(fileData); // 파일에 데이터 쓰기
        fos.close(); // 파일 닫기
        return savedName; // uuid.확장자
    }

    // 파일 삭제
    public void deleteFile(String filePath) throws Exception {
        File deleteFile = new File(filePath);
        if(deleteFile.exists()) {
            deleteFile.delete();
            log.info("파일 삭제 성공");
        } else {
            log.info("파일 삭제 실패 ( 파일이 존재하지 않음 )");
        }
    }
}
