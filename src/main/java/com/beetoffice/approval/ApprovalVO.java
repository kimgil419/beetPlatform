package com.beetoffice.approval;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString 
public class ApprovalVO {
	@Getter @Setter 
	private String  a_content, first_approval, second_approval, third_approval,
	regdate, a_title, urgent, refuse, searchCondition, searchKeyword,
	approval_id_a, approval_id_b, approval_id_c, a_num, user_id, option, user_name, user_name1, user_name2, user_name3;
	
	@Getter @Setter
	private String to;
	
	



	public ApprovalVO() {
		super();
	}


	
}
