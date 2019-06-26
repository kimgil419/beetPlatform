package com.beetoffice.companyevent;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("CompanyEventDAO")
public class CompanyEventDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public CompanyEventDAO() {
    }

    public List<CompanyEventVO> showEventList(CompanyEventVO vo) {
        return mybatis.selectList("companyevent.selectContent", vo);
    }
}
