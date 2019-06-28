package com.beetoffice.searchemployee;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchEmployeeController {

    @Autowired
    private SearchEmployeeService searchEmployeeService;

    @RequestMapping(value="/reacttest.do", produces="application/json; charset=utf8")
//    @CrossOrigin(origins = "http://localhost:3000")
    public @ResponseBody
    String react(SearchEmployeeVO vo, Model model){

        List<SearchEmployeeVO> list = searchEmployeeService.getUserList(vo);
        Gson json = new Gson();

        model.addAttribute("list", list);
        System.out.println(json.toJson(list));
        return json.toJson(list);
    }
}
