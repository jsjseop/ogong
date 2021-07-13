package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {

	private int commentNo;
	private Board commentBoard;
	private User commentWriter;
	private String nickname;
	private String commentContents;
	private Date commentRegDate;
	

}
