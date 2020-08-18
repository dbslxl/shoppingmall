package com.test.beans;

public class PageBean {
	private static int countPerPage = 20;
	private int currentPage;
	private int totalCount;
	
	private int totalPage;
	private int minPage;
	private int maxPage;
	
	public PageBean(int currentPage, int totalCount) {
		this.currentPage=currentPage;
		this.totalCount=totalCount;
		totalPage=(totalCount/countPerPage)+1;
		minPage=(currentPage-1)/10*10+1;
		maxPage=minPage+9;
		if(maxPage>=totalPage) {
			maxPage=totalPage;
		}
	}
	
	public static int getCountPerPage() {
		return countPerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getMinPage() {
		return minPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	
	
}
