package com.beetoffice.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class UserVO {
	
 @Getter @Setter
   private String user_id, user_password, dept, birth, job_id, user_name, user_position, phone, cphone, searchCondition, searchKeyword;
    
  @Getter @Setter
   private int user_number;

 
}

