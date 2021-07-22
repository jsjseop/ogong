package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LearningHistory {

	private int learningHistoryNo;
	private int studyNo;
	private String email;
	private String learningTime;
	private String learningType;
	private Date learningDate;
	
}
