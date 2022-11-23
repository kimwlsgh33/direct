package com.linker.util.upload;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//-----------------------------------------------------------------------------------------------------------
// 업로드에 사용할 미디어에 대한 정의 클래스
//-----------------------------------------------------------------------------------------------------------
public class MediaUtils {
	
	// static으로 선언되었으므로 프로그램이 실행될 때
	// private static Map<String, MediaType> mediaMap; 과 static{}은 바로 메모리에 로딩된다.
	private static Map<String, MediaType> mediaMap;

	//-----------------------------------------------------------------------------------------------------------
	// static block
	// 클래스를 로딩할 때 제일 먼저 실행되는 코드
	//-----------------------------------------------------------------------------------------------------------
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 이미지 파일인지 아닌지 구분하는 메서드
	// 이미지 파일을 업로드하면 썸네일 파일을 만들고, 나머지 파일들은 그냥 업로드한다.
	// getMediaType(String type)을 호출하여
	// 위의 static{}에 있으면 이미지파일, 아니면 일반파일로 구분.
	//-----------------------------------------------------------------------------------------------------------
	public static MediaType getMediaType(String type) {
		// toUpperCase() => 대문자로 변경
		return mediaMap.get(type.toUpperCase());
	}
	
	
}
