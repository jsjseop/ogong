package com.ogong.common;

import lombok.Data;

@Data
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int studyInterest;
	private int searchSort;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	
}
