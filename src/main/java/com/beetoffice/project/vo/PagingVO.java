package com.beetoffice.project.vo;

public class PagingVO {

	private int countPost = 5;
	private int countPage = 5;
	private int totalPost;
	private int totalPage;
	private int currentPage;
	private int startPost;
	private int endPost;
	private int viewPost;
	private int startPage;
	private int endPage;
	private String searchCondition, searchKeyword;
	
	public PagingVO(int totalPost, int currentPage) {
		System.out.println(">> PagingVO 객체 생성");
		this.totalPost = totalPost;
		this.currentPage = currentPage;
		setTotalPage();
		setStartPost();
		setEndPost();
		setViewPost();
		setStartPage();
		setEndPage();
	}
	
	public void setCountPost(int countPost) {
		this.countPost = countPost;
	}
	public int getCountPost() {
		return countPost;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getCountPage() {
		return countPage;
	}
	
	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}
	public int getTotalPost() {
		return totalPost;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setTotalPage() {
		this.totalPage = totalPost / countPost;
		if (totalPost % countPost > 0) {
			totalPage++;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setStartPost() {
		this.startPost = currentPage * countPost - countPost;
	}
	public int getStartPost() {
		return startPost;
	}
	public void setEndPost() {
		this.endPost = startPost + countPost - 1;
		if (endPost > totalPost) {
			endPost = totalPost;
		}
	}
	public int getEndPost() {
		return endPost;
	}
	public void setViewPost() {
		this.viewPost = endPost - startPost + 1;
	}
	public int getViewPost() {
		return viewPost;
	}
	
	public void setStartPage() {
		this.startPage = (currentPage - 1) / countPage * countPage + 1;
	}
	public int getStartPage() {
		return startPage;
	}
	
	public void setEndPage() {
		this.endPage = startPage + countPage - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
	public int getEndPage() {
		return endPage;
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

	@Override
	public String toString() {
		return "PagingVO [countPost=" + countPost + ", countPage=" + countPage + ", totalPost=" + totalPost
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startPost=" + startPost
				+ ", endPost=" + endPost + ", viewPost=" + viewPost + ", startPage=" + startPage + ", endPage="
				+ endPage + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}

	
}

































