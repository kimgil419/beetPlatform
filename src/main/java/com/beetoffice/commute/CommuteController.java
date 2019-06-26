package com.beetoffice.commute;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller

@SessionAttributes("commute")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;
	
	public String getCommuteList(CommuteVO vo, 
			Model model) {
	
		List<CommuteVO> commuteList = commuteService.getCommuteList(vo);
		
		model.addAttribute("commuteList", commuteList);
		
		return "getCommuteList.jsp";
	}	

	@RequestMapping("/insertCommute.do")
	public String insertCommute(CommuteVO vo) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 처리 - insertCommute()");
		
		commuteService.insertCommute(vo);
		return "commuteList.do";
	}
	
	@RequestMapping("/updateCommute.do")
	public String updateApproval(@ModelAttribute("commute") CommuteVO vo) {
		System.out.println(">>> 처리 - updateCommute()");
		System.out.println(" vo : " + vo);
		
		
		commuteService.updateCommute(vo);
		return "commuteList.do";
	}
	
	
	
}
