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

import com.beetoffice.user.UserVO;


@Controller

@SessionAttributes("commute")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;
	
	 @ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			//key: ?���?, value: TITLE
			//key: ?��?��, value: CONTENT
			Map<String, String> conditionMap = new HashMap<>();
			
			conditionMap.put("이름", "NAME");
			conditionMap.put("부서", "DEPT");
			conditionMap.put("날짜", "IN_TIME");
			conditionMap.put("직급", "POSITION");
			conditionMap.put("직무", "JOB_ID");
			return conditionMap;
		}
	   
	
	@RequestMapping("/getCommuteList.do")
	public String getCommuteList(CommuteVO vo, 
			Model model) {
		
		System.out.println(">>>  목록 조회 처리- getUserList()");
		System.out.println("condition: " + vo.getSearchCondition());
		System.out.println("keyword: -" + vo.getSearchKeyword() + "-");
		
		//null체크 
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("IN_TIME");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리 condition: " + vo.getSearchCondition());
		System.out.println("null처리 keyword: -" + vo.getSearchKeyword() + "-");		
		List<CommuteVO> commuteList = commuteService.getCommuteList(vo);
		System.out.println(commuteList);
		model.addAttribute("commuteList", commuteList);
		
		return "commute/getCommuteList";
	}	

	@RequestMapping("/insertCommute.do")
	public String insertCommute(CommuteVO vo) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 처리 - insertCommute()");
		
		commuteService.insertCommute(vo);
		return "getCommuteList.do";
	}
	
	@RequestMapping("/updateCommute.do")
	public String updateApproval(@ModelAttribute("commute") CommuteVO vo) {
		System.out.println(">>> 처리 - updateCommute()");
		System.out.println(" vo : " + vo);
		
		
		commuteService.updateCommute(vo);
		return "getCommuteList.do";
	}
	
	
	
}
