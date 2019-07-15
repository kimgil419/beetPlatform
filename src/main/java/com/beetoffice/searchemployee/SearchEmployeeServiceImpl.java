package com.beetoffice.searchemployee;

import com.beetoffice.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("SearchEmployeeService")
public class SearchEmployeeServiceImpl implements SearchEmployeeService {

    @Autowired
    private SearchEmployeeDAO seDAO;

    @Override
    public List<SearchEmployeeVO> getUserList(SearchEmployeeVO vo) {
        return seDAO.getList(vo);
    }

    @Override
    public List<SearchEmployeeVO> getUserListbyKeyword(String keyword) {
        return seDAO.getListbyKeyword(keyword);
    }
    @Override
    public List<SearchEmployeeVO> getUserListForSearch(SearchEmployeeVO vo) {
        return seDAO.getListForSearch(vo);
    }

    @Override
    public List<SearchEmployeeVO> getUserListForPaging(Map num) {
        return seDAO.getListForPaging(num);
    }

}
