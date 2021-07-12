package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Report {
	
	private int reportNo; 				
	private Answer reportAnswer;		
	private Comment reportComment;		
	private Board reportBoard;		
	private User reportUser;			
	private String reportReason;	
	private Date reportDate;		
	private String suspendType;		

}
