package com.beetoffice.companyevent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CompanyEventController {

    @Autowired
    private CompanyEventService companyEventService;

    @RequestMapping("/getEventList.do")
    public String getEventList(CompanyEventVO vo, Model model) {

        List<CompanyEventVO> eventList = companyEventService.getEventList(vo);

        model.addAttribute("eventList", eventList);
        return "getEventList.jsp";
    }
}
