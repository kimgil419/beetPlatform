package com.beetoffice.searchemployee;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SearchEmployeeController {

    @Autowired
    private SearchEmployeeService searchEmployeeService;

    @RequestMapping(value = "/showEmployee.do", produces = "application/json; charset=utf8")
    @CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:5050"})
    public String showEmployee(SearchEmployeeVO vo, Model model) {

        List<SearchEmployeeVO> employeelist = searchEmployeeService.getUserList(vo);
        Gson json = new Gson();

        model.addAttribute("list", json.toJson(employeelist));

        return "searchemployee/showEmployeeList";
    }


    @RequestMapping(value = "/searchEmployee.do", produces = "application/json; charset=utf8")
    @CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:5050"})
    public @ResponseBody
    String searchEmployee(String keyword, Model model) {

        List<SearchEmployeeVO> list = searchEmployeeService.getUserListbyKeyword(keyword);
        Gson json = new Gson();
        System.out.println(json.toJson(list));
//        model.addAttribute("list", list);
        return json.toJson(list);
    }


    @RequestMapping(value = "/searchEmployeeForSelect.do", produces = "application/json; charset=utf8")
    public @ResponseBody
    String searchEmployeeForSelect(SearchEmployeeVO model) {

        List<SearchEmployeeVO> list = searchEmployeeService.getUserListForSearch(model);
        Gson json = new Gson();

        return json.toJson(list);
    }








    @RequestMapping(value = "/userList.do", produces = "application/json; charset=utf8")
    @CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:5050"})
    public @ResponseBody String userList(SearchEmployeeVO vo) {

        List<SearchEmployeeVO> employeelist = searchEmployeeService.getUserList(vo);
        Gson json = new Gson();

        Map data = new HashMap<>();
        data.put("firstData", employeelist.subList(0, 10));
        data.put("dataLength", employeelist.size());

        System.out.println(json.toJson(data));
        return json.toJson(data);
    }

    @RequestMapping(value = "/searchUserList.do", produces = "application/json; charset=utf8")
    @CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:5050"})
    public @ResponseBody
    Map searchUserList(String keyword) {

        System.out.println(keyword);

        List<SearchEmployeeVO> list = searchEmployeeService.getUserListbyKeyword(keyword);

        System.out.println(list);

        Map data = new HashMap<>();
        data.put("firstData", list.subList(0, 10));
        data.put("dataLength", list.size());

        System.out.println(data);

        return data;
    }

    @RequestMapping(value = "/eachUserList.do", produces = "application/json; charset=utf8")
    @CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:5050"})
    public @ResponseBody String eachUserList(String keyword, Integer start, Integer length) {

        System.out.println(keyword);
        System.out.println(start);
        System.out.println(length);


        Map data = new HashMap<>();
        data.put("start", start);
        data.put("length", length);
        data.put("keyword", keyword);

        System.out.println(data);

        List<SearchEmployeeVO> employeelist = searchEmployeeService.getUserListForPaging(data);
        Gson json = new Gson();

        return json.toJson(employeelist);
    }


}
