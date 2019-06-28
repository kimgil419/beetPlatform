package com.beetoffice.searchemployee;

import java.util.List;

public interface SearchEmployeeService {

    List<SearchEmployeeVO> getUserList(SearchEmployeeVO vo);
    List<SearchEmployeeVO> getUserListbyKeyword(String keyword);
}
