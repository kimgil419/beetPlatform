package com.beetoffice.searchemployee;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SearchEmployeeController {

    @Autowired
    private SearchEmployeeService searchEmployeeService;

    @RequestMapping(value="/showEmployee.do", produces="application/json; charset=utf8")
    public String showEmployee(SearchEmployeeVO vo, Model model){

        List<SearchEmployeeVO> employeelist = searchEmployeeService.getUserList(vo);
        Gson json = new Gson();

        model.addAttribute("list", json.toJson(employeelist));

        return "searchemployee/showEmployeeList";
    }


    @RequestMapping(value="/searchEmployee.do", produces="application/json; charset=utf8")
    public @ResponseBody
    String searchEmployee(String keyword, Model model){

        List<SearchEmployeeVO> list = searchEmployeeService.getUserListbyKeyword(keyword);
        Gson json = new Gson();

//        model.addAttribute("list", list);
        return json.toJson(list);
    }
    
    
    @RequestMapping(value="/searchEmployeeForSelect.do", produces="application/json; charset=utf8")
    public @ResponseBody
    String searchEmployeeForSelect(SearchEmployeeVO model){

        List<SearchEmployeeVO> list = searchEmployeeService.getUserList(model);
        Gson json = new Gson();

        return json.toJson(list);
    }


}
