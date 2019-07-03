package com.beetoffice.searchemployee;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class SearchEmployeeVO {

    @Getter @Setter
    String firstjoin, dept, user_name, user_position, phone, cphone, user_email;
    
    @Getter @Setter
    int user_id;

}
