package com.beetoffice.project.vo;

import com.beetoffice.project.PagingProcess;

public class PagingProcessTest {

	public static void main(String[] shockWave) {
		
		PagingProcess pu = new PagingProcess();
		pu.setCurrentPage("1");
		pu.setTotalPost(0);
		System.out.println(pu);
	}
}
