package com.beetoffice.project.vo;

import com.beetoffice.project.PagingProcess;

public class PagingMain {

	public static void main(String[] shockWave) {
		
		
		PagingProcess pu = new PagingProcess();
		pu.setCurrentPage("9");
//		System.out.println(pu);
		pu.setTotalPost(240);
		System.out.println(pu);
		
		
	}
}
