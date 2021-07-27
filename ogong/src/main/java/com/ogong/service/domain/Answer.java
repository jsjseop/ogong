package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Answer {

	private int answerNo;
	private String answerContents;
	private Date answerRegDate;
	private User answerWriter;
	private int boardNo;
	private String adoptionFlag;
	private Date adoptionDate;
	private int adoptionCount;

}
