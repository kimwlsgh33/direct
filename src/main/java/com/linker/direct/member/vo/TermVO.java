package com.linker.direct.member.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

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
