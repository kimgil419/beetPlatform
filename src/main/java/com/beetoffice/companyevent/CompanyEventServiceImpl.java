package com.beetoffice.companyevent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CompanyEventService")
public class CompanyEventServiceImpl implements CompanyEventService {

    @Autowired
    private CompanyEventDAO ceDAO;


    @Override
    public void insertEvent(CompanyEventVO vo) {

    }

    @Override
    public void updateEvent(CompanyEventVO vo) {

    }

    @Override
    public void deleteEvent(CompanyEventVO vo) {

    }

    @Override
    public List<CompanyEventVO> getEventList(CompanyEventVO vo) {
        return ceDAO.showEventList(vo);
    }
}
