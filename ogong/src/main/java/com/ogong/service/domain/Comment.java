package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {

	private String commentContents;
	private User commentWriter;
	private Date commentRegDate;
	private int commentNo;
	private Board commentBoard;

}
