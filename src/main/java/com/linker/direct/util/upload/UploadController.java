package com.linker.direct.util.upload;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@Controller
@RequestMapping("/util/upload")
@RequiredArgsConstructor
public class UploadController {
    private final UploadService uploadService;

    // 메소드의 방식을 다르게하면, 같은 url을 여러번 매핑 가능
    @RequestMapping(value="/uploadForm", method = RequestMethod.GET)
    public void uploadForm() {
        log.info("UploadController/uploadForm() View 실행");
    }

    @RequestMapping(value="/uploadForm", method = RequestMethod.POST)
    public String uploadForm(Model model, MultipartFile file) throws Exception {
        log.info("UploadController/uploadForm() Logic 실행");
        String fileName = "";
        Long fileSize = 0L;
        byte[] fileData = null;

        if(file != null) {
            fileName = file.getOriginalFilename();
            fileSize = file.getSize();
            fileData = file.getBytes(); // 파일의 내용을 byte[]로 가져옴
            log.info("file name: " + fileName);
            log.info("file size: " + fileSize);
            String uuid = uploadService.upload(fileName, fileData);
            model.addAttribute("uuid", uuid);
        } else {
            log.info("file is null");
        }

        return "util/upload/uploadResult";
    }


    @RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String uploadAjax(MultipartFile[] uploadFile) throws IOException {
        log.info("UploadController/uploadAjax() 실행");


        if(uploadFile != null) {
            String[] uuids = new String[uploadFile.length];
            for(MultipartFile file : uploadFile) {
                log.info("file name: " + file.getOriginalFilename());
                log.info("file size: " + file.getSize());
                log.info("file type: " + file.getContentType());
                String uuid = uploadService.upload(file.getOriginalFilename(), file.getBytes());
                log.info("uuid: " + uuid);
            }
        } else {
            log.info("file is null");
        }
//        return "util/upload/images";
        return "util/upload/uploadForm";
    }
}

/**
 * 1. pom.xml에 commons-fileupload, commons-io 추가
 * 2. servlet-context.xml에 multipartResolver 추가
 *
 */
