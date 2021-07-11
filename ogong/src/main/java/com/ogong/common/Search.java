package com.ogong.common;


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
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	public int getStudyInterest() {
		return studyInterest;
	}

	public void setStudyInterest(int studyInterest) {
		this.studyInterest = studyInterest;
	}
	
	

	public int getSearchSort() {
		return searchSort;
	}

	public void setSearchSort(int searchSort) {
		this.searchSort = searchSort;
	}

	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", studyInterest=" + studyInterest + ", searchSort=" + searchSort + ", pageSize="
				+ pageSize + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + "]";
	}
	

	
}