package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Banana {

	private int bananaNo;				
	private User user;		
	private String bananaAmount;		
	private Date bananaHistoryDate;		
	private String bananaHistory;		
	
}
