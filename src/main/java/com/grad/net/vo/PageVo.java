package com.grad.net.vo;

public class PageVo {
	
	private int numToShow = 20;	//한페이지에 보여줄 게시물 개수
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private int total;	// 보여줄 게시물의 전체 갯수
	private int totalPage;
	private int page=1;	//디폴트 페이지는 1 (page값이 안넘어 온 경우);
	
	
	public void calcPage(int total) {
		
		this.total = total;
		totalPage =  (total / numToShow); // (전체 게시물 갯수 나누기) / (한 페이지에 보여줄 게시물 갯수)
		
		if((total % numToShow)>0) {
			totalPage = totalPage + 1;
		}
		
		
		startPage = (page - (page - 1) % 5) ; // html에서 보여줄 시작 페이지번호 (ex 1~10, 11~20)
		endPage = startPage + 4; // html에서 보여줄 마지막 페이지번호 // 기본단위 10
		
		//게산된 마지막 페이지가 보여줄 전페 페이지보다 크면 계산된 마지막페이지로
		if(endPage>totalPage) {
			endPage = totalPage;
		}
		
		startRow = ((page-1) * numToShow) ;
		
	}
	
	
	public int getNumToShow() {
		return numToShow;
	}
	public void setNumToShow(int numToShow) {
		this.numToShow = numToShow;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}


	@Override
	public String toString() {
		return "PageVo [numToShow=" + numToShow + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage="
				+ startPage + ", endPage=" + endPage + ", total=" + total + ", totalPage=" + totalPage + ", page="
				+ page + "]";
	}
	
	

}