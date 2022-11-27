package com.linker.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/util")
public class UtilController {
	
	private static final Logger logger = LoggerFactory.getLogger(UtilController.class);
	
	// 주소검색
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address() throws Exception {
		
		logger.info("UtilController 주소검색 화면으로 이동.....");
		
		return "/util/address";
	}
}
