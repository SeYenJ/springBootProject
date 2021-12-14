package com.example.vo;


public class PageMaker {
   private int page; // 해당 페이지
   private int perPageNum; //페이지당 보여줄 게시물 수 
   private int pageStart;	//시작 게시물
   private int totalCount;	//총 게시물
   private int startPage; //시작페이지
   private int endPage; //끝 페이지
   private int tempEndPage;	//(총 게시물 / 보여줄 페이징)
   private boolean prev ; //이전
   private boolean next; //다음
   
   
   
   private int displayPageNum =5; //페이지당 보여줄 페이징 수  
   //검색
   private String temp;
   private String searchType;
   private String keyword;
   
   //기본 생성
   public PageMaker() {
      this.page = 1;   
      this.perPageNum =5; 
   }

   
   public void setTotalCount(int totalCount) {            
      this.totalCount = totalCount;
      
   }
   
   public void page(PageMaker vo){
	   this.page = vo.page;
	   setPage();
   }
   
   //페이징 처리
   public void setPage(){
      
	   endPage = (int) (Math.ceil(page/(double) displayPageNum) * displayPageNum);
	   
	   startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double)perPageNum));
		this.tempEndPage = tempEndPage;

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true; 
		next = endPage * perPageNum >= totalCount ? false : true;
	     
   }
 //보여주는 페이지에 시작 
    public int getPageStart() {
       return (this.page-1) * this.perPageNum;
    }
    public void setPageStart(int pageStart) {
       this.pageStart = pageStart;
    }
   
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getTempEndPage() {
		return tempEndPage;
	}
	
	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public String getTemp() {
		return temp;
	}
	
	public void setTemp(String temp) {
		this.temp = temp;
	}
	
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
   @Override
   public String toString() {
   	return "PageMaker [page=" + page + ", perPageNum=" + perPageNum + ", displayPageNum=" + displayPageNum
   			+ ", pageStart=" + pageStart + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
   			+ endPage + ", tempEndPage=" + tempEndPage + ", prev=" + prev + ", next=" + next + ", temp=" + temp
   			+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
   }
}