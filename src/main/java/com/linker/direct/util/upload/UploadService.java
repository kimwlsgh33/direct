package com.linker.direct.util.upload;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@Service
public class UploadService {
    // servlet-context.xml에 설정된 uploadPath를 가져온다.
//    @Resource(name="uploadPath")
    @Value("${uploadPath}")
    private String uploadPath;

    // uuid 이용해, 파일 저장하기
    public String upload(String originName, byte[] fileData) throws IOException {
        log.info("UploadService/upload() 실행");
        log.info("uploadPath: " + uploadPath);
        String uuid = UUID.randomUUID().toString() + "_" + originName;
        File target = new File(uploadPath, uuid);

        // FileCopyUtils : 스프링에서 제공하는 파일 복사 클래스
        FileCopyUtils.copy(fileData, target);
        return uuid;
    }
}

/**
 * 스트림(stream)이란?
 * 1. 데이터를 연속적으로 처리할 수 있도록 연결한 통로
 * 2. 데이터를 읽어 들이는 입력 스트림과, 데이터를 출력하는 출력 스트림으로 나뉜다.
 * 3. 스트림은 데이터를 1byte씩 처리한다.
 */