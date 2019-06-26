package com.beetoffice.companyevent;

import java.util.List;

public interface CompanyEventService {

    void insertEvent(CompanyEventVO vo);
    void updateEvent(CompanyEventVO vo);
    void deleteEvent(CompanyEventVO vo);
    List<CompanyEventVO> getEventList(CompanyEventVO vo);

}
