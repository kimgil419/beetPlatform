package com.beetoffice.approval;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString 
public class ApprovalVO {
	@Getter @Setter 
	private String  a_content, ok1, ok2, ok3,
	regdate, a_title, urgent, refuse, searchCondition, searchKeyword;
	@Getter @Setter
	private int a_num, user_id, user_id1, user_id2, user_id3;



	public ApprovalVO() {
		super();
	}


	
}
