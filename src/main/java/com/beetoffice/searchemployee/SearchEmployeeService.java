package com.beetoffice.searchemployee;

import java.util.List;
import java.util.Map;

public interface SearchEmployeeService {

    List<SearchEmployeeVO> getUserList(SearchEmployeeVO vo);
    List<SearchEmployeeVO> getUserListbyKeyword(String keyword);
	List<SearchEmployeeVO> getUserListForSearch(SearchEmployeeVO vo);
	List<SearchEmployeeVO> getUserListForPaging(Map num);
}
