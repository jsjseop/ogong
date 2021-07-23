package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Banana {

	private int bananaNo;				
	private User bananaEmail;		
	private int bananaAmount;		
	private Date bananaHistoryDate;		
	private String bananaHistory;	
	private String bananaCategory;
	
}
