package com.linker.direct.review.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {

	private int cno;	// 댓글 번호
	private int review_no;	// 댓글이 달릴 리뷰 번호
	private String content;	// 댓글 내용
	private String writer;	// 댓글 작성자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Timestamp reg_date;	// 댓글 작성 일시
	
}
