package com.beetoffice.project;

import java.util.Date;

public class PeriodCalculator {
	public PeriodCalculator() {
		super();
	}

	public static double periodCalculator(Date startDate, Date endDate) {
		double period = Math.floor((endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60 / 24);
		
		return period;
	}
	
}
