package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Answer {

	private int answerNo;
	private String answerContents;
	private String answerTitle;
	private boolean adoption;
	private Date answerDate;
	private User answerWriter;
	private Board board;
	private String adoptionFlag;
	private Date adoptionDate;
	private int adoptionCount;
}
