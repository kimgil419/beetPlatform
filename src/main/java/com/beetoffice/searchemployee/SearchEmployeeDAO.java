package com.beetoffice.searchemployee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("SearchEmployeeDAO")
public class SearchEmployeeDAO {


    @Autowired
    private SqlSessionTemplate mybatis;

    public SearchEmployeeDAO() {
    }

    public List<SearchEmployeeVO> getList(SearchEmployeeVO vo){
        return mybatis.selectList("searchemployee.selectAll", vo);
    }
    public List<SearchEmployeeVO> getListbyKeyword(String keyword){
        return mybatis.selectList("searchemployee.selectbykeyword", keyword);
    }
    
    public List<SearchEmployeeVO> getListForSearch(SearchEmployeeVO vo){
        return mybatis.selectList("searchemployee.selectAllForSearch", vo);
    }
    public List<SearchEmployeeVO> getListForPaging(Map num) {
        return mybatis.selectList("searchemployee.listforpaging", num);
    }
}
