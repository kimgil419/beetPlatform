package com.beetoffice.approval;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString 
public class ApprovalVO {
	@Getter @Setter 
	private String user_id, a_content, user_id1, user_id2, user_id3, ok1, ok2, ok3,
	regdate, a_title, searchCondition, searchKeyword;
	@Getter @Setter 
	private int a_num;


	public ApprovalVO() {
		super();
	}


	public ApprovalVO(String user_id, String a_content, String user_id1, String user_id2, String user_id3, String ok1,
			String ok2, String ok3, String regdate, int a_num, String a_title, String searchCondition,
			String searchKeyword) {
		super();
		this.user_id = user_id;
		this.a_content = a_content;
		this.user_id1 = user_id1;
		this.user_id2 = user_id2;
		this.user_id3 = user_id3;
		this.ok1 = ok1;
		this.ok2 = ok2;
		this.ok3 = ok3;
		this.regdate = regdate;
		this.a_num = a_num;
		this.a_title = a_title;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
	}

   
	   
	     
	
}
