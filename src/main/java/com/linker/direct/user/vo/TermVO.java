package com.linker.direct.user.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component("termVO")
@Data
public class TermVO {

	private int commercial;
	private int night;
	private Long user_id;
	
	public TermVO() {}
	public TermVO(int commercial, int night) {
	
		this.commercial	= commercial;
		this.night		= night;
		
	}

}
