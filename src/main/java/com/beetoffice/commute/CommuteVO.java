package com.beetoffice.commute;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CommuteVO {

    @Getter @Setter
    String in_time, out_time, user_id, user_name, dept, user_position;
	


}
