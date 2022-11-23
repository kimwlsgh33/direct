package com.linker.util.upload;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//-----------------------------------------------------------------------------------------------------------
// AJAX를 이용하여 파일 올리기
//-----------------------------------------------------------------------------------------------------------
@Controller
@RequestMapping(value="/util/upload")
public class AjaxUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxUploadController.class);
	
	// 업로드할 경로(디렉토리)는 servlet-context.xml에 설정해 놓았다.
	@Resource(name = "uploadPath")
	String uploadPath;
	
	//-----------------------------------------------------------------------------------------------------------
	// 파일 올리기(AJAX) 화면 불러오기
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/uploadAjax", method = RequestMethod.GET)
	public String uploadAjax() {
		
		logger.info("AjaxUploadController 파일 올리기(AJAX) 화면 불러오기");
		return "/util/upload/uploadAjax";
		
	}
	
}
