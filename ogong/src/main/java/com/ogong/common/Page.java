package com.ogong.common;

import lombok.Data;

@Data
public class Page {
	
	///Field
	private int currentPage;		
	private int totalCount;			
	private int pageUnit;			
	private int pageSize;			
	private int maxPage;			
	private int beginUnitPage;	
	private int endUnitPage;		
	
}
