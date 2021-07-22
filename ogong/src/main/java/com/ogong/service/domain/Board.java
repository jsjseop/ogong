package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	
	private String boardTitle;
	private String boardContents;
	private int boardNo;
	private String boardCategory;
	private Date boardRegDate;
	private Date boardWriteDate;
	private int boardRegBanana;
	private User writer;
	private int commentCount;
	private int recommendCount;
	private int answerCount;
	private int viewCount;
	private String boardInterest;
	private String fileFlag;
	private Study study;
	
}	
	
