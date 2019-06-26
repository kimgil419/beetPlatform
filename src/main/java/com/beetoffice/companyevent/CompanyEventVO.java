package com.beetoffice.companyevent;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CompanyEventVO {

    @Getter @Setter
    int idx, event_date;
    @Setter @Getter
    String event_name, event_content;

}
