package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Answer {

	private int answerNo;
	private String answerContent;
	private String answerTitle;
	private boolean adoption;
	private Date answerDate;
	private String answerWriter;
	private Board board;
	private Date adoptionDate;
	
}
