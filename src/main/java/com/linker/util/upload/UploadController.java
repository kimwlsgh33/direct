package com.linker.util.upload;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

//-----------------------------------------------------------------------------------------------------------
// 파일 올리기 컨트롤러
// servlet-context.xml에 component-scan을 등록한다.
//-----------------------------------------------------------------------------------------------------------
@Controller
@RequestMapping(value="/util/upload")
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	//-----------------------------------------------------------------------------------------------------------
	// servlet-context.xml에서 선언한 파일올리기 설정을 참조한다.
	// 자바 11부터는 @Resource를 사용하기 위해서
	// Javax Annotation API 를 사용한다
	// 파일 업로드 경로 : servlet-context.xml에 기술한다.
	//-----------------------------------------------------------------------------------------------------------
	@Resource(name="uploadPath")
	// String uploadPath = "c:/data/upload"; <==직접 써도 된다.
	String uploadPath;	// 파일 경로를 공통으로 사용하기 위해서 선언한다.
	
	//-----------------------------------------------------------------------------------------------------------
	// 파일 올리기 화면으로 이동
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/uploadForm", method = RequestMethod.GET)
	public String uploadForm() {
		
		logger.info("UploadController 파일 올리기 화면으로 이동.....");
		
		return "/util/upload/uploadForm";
		
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 업로드된 파일을 처리하기
	// MultipartFile file : 업로드한 파일이 저장된다(임시경로)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception {
		
		if(!file.isEmpty()) {
			System.out.println("첨부된 파일이 있습니다.");
		} else {
			System.out.println("첨부된 파일이 없습니다.");
		}
		
		System.out.println("파일이름 : " + file.getOriginalFilename());
		System.out.println("파일크기 : " + file.getSize());
		System.out.println("컨텐츠 타입 : " + file.getContentType());
		
		String savedName = file.getOriginalFilename();
		savedName = uploadFile(savedName, file.getBytes());
		
		mav.setViewName("util/upload/uploadResult"); // 뷰의 이름 : 처리가 끝나고 돌아갈 페이지
		mav.addObject("savedName", savedName); // 전달할 데이터
		return mav;	// uploadResult.jsp로 포워딩된다.
		
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 파일 이름이 중복되지 않도록 처리하는 메서드
	//-----------------------------------------------------------------------------------------------------------
	String uploadFile(String originalName, byte[] fileData) throws Exception {
		
		// Universal Unique Identifier (범용식별자) UUID => 코드를 랜덤으로 만들어 낸다.
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		
		// new File(디렉토리, 파일이름);
		File target = new File(uploadPath, savedName);
		
		// 첨부파일을 임시 디렉토리에서 우리가 지정한 디렉토리로 복사한다.
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
		
	}
	
}
