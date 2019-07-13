package com.beetoffice.project.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class ProjectVO {

	@Getter @Setter
	int project_idx, project_contract_amount;
	@Getter @Setter
	String project_name, project_contractor, project_progress, project_manager, user_name;
	@Getter @Setter
	String project_reg_date, project_start_date, project_end_date;
	@Getter @Setter
	String project_period, project_deadline;
	@Getter @Setter
	double project_percentage;
	
	
}
