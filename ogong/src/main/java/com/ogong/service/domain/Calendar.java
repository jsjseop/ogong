package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Calendar {

	private int calendarNo;			
	private Study study;		
	private String calendarTitle;		
	private String calendarContents;	
	private Date calendarStartDate;		
	private Date calendarEndDate;		
	
}
