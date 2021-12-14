package com.example.vo;


public class SearchVO {
	
	private String searchType; 
	private String keyword;
	private String temp;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	
	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", keyword=" + keyword + ", temp=" + temp + "]";
	}
	


}
