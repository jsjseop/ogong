package com.ogong.service.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	
	private String boardTitle;
	private String boardContents;
	private int boardNo;
	private Date boardWriteDate;
	private User writer;
	private int commentCount;
	private int recommendCount;
	private int ViewCount;
	private int interest;
	private boolean fileFlag;
	private String thumbnail;
	private String studyId;
	
}	
	