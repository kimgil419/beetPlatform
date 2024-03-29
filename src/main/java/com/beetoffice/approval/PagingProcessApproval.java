package com.beetoffice.approval;

public class PagingProcessApproval {

	private int countPost = 10;
	private int countPage = 5;
	private int totalPost;
	private int totalPage;
	private String currentPage;
	private int startPost;
	private int endPost;
	private int viewPost;
	private int startPage;
	private int endPage;
	
	private String user_id, searchCondition, searchKeyword;

	public PagingProcessApproval() {
		super();
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
		setTotalPage();
		setStartPage();
		setEndPage();
		setStartPost();
		setEndPost();
		setViewPost();
	}
	public int getTotalPost() {
		return totalPost;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	public String getCurrentPage() {
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
		this.startPost = Integer.parseInt(currentPage) * countPost - countPost;
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
		this.startPage = (Integer.parseInt(currentPage) - 1) / countPage * countPage + 1;
		System.out.println("startPage: " + startPage);
	}
	public int getStartPage() {
		return startPage;
	}
	
	public void setEndPage() {
		System.out.println("startPage in end: " + startPage);
		System.out.println("countPage in end: " + countPage);
		this.endPage = startPage + countPage - 1;
		System.out.println(startPage + countPage - 1);
		System.out.println(endPage > totalPage);
		System.out.println(endPage);
		if (endPage > totalPage) {
			endPage = totalPage;
			System.out.println("totalPage: " + totalPage);
			System.out.println("endPage: " + endPage);
		}
		System.out.println();
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


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id2) {
		this.user_id = user_id2;
	}

	@Override
	public String toString() {
		return "PagingProcess [countPost=" + countPost + ", countPage=" + countPage + ", totalPost=" + totalPost
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startPost=" + startPost
				+ ", endPost=" + endPost + ", viewPost=" + viewPost + ", startPage=" + startPage + ", endPage="
				+ endPage + ", user_id=" + user_id + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}

	
}





