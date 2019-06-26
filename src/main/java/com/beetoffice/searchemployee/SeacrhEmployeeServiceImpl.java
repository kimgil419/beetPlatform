package com.beetoffice.searchemployee;

import com.beetoffice.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SeacrhEmployeeServiceImpl implements SearchEmployeeService {

    @Autowired
    private SearchEmployeeDAO seDAO;

    @Override
    public List<SearchEmployeeVO> getUserList(SearchEmployeeVO vo) {
        return null;
    }
}
