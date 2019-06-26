package com.beetoffice.project.vo;

public class PagingMain {

	public static void main(String[] shockWave) {
		
		PagingVO pu = new PagingVO(255, 1);
		
		System.out.println("totalPage: " + pu.getTotalPage());
		System.out.println("currentPage: " + pu.getCurrentPage());
		System.out.println("startPage: " + pu.getStartPage());
		System.out.println("endPage: " + pu.getEndPage());
		System.out.println("startPost: " + pu.getStartPost());
		System.out.println("endPost: " + pu.getEndPost());
		System.out.println();
		
		pu = new PagingVO(350, 34);
		System.out.println("totalPage: " + pu.getTotalPage());
		System.out.println("currentPage: " + pu.getCurrentPage());
		System.out.println("startPage: " + pu.getStartPage());
		System.out.println("endPage: " + pu.getEndPage());
		System.out.println("startPost: " + pu.getStartPost());
		System.out.println("endPost: " + pu.getEndPost());
		
	}
}
