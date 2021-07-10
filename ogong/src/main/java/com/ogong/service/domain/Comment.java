package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {

	private String commentContent;
	private String commentWriter;
	private Date commentRegDate;
	private int commentNo;
	private Board Commentboard;

}
