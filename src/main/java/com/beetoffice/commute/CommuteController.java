package com.beetoffice.commute;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.beetoffice.user.UserVO;
import javax.servlet.http.HttpSession;



@Controller

@SessionAttributes("commute")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;
	
	 @ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			
			Map<String, String> conditionMap = new HashMap<>();
			
			conditionMap.put("이름", "user_name");
			conditionMap.put("부서", "dept");
			conditionMap.put("직급", "user_position");
			conditionMap.put("직무", "job_id");
			return conditionMap;
		}
	   
	
	@RequestMapping("/getCommuteList.do")
	public String getCommuteList(CommuteVO vo, 
			Model model) {
		
		System.out.println(">>>  목록 조회 처리- getUserList()");
		System.out.println("날짜 검색" + vo.getIn_time1() + " ~ " + vo.getIn_time2());
		System.out.println("condition: " + vo.getSearchCondition());
		System.out.println("keyword: -" + vo.getSearchKeyword() + "-");
		
		//null체크 
		
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("user_name");
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
		return "redirect:getCommuteList.do";
	}
	
	
	@RequestMapping("/getCommute.do")
	public String getCommute(CommuteVO vo, Model model, HttpSession session) {
		

	
		System.out.println("1122112" + session.getAttribute("userInfo"));
		
		
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String id = user.getUser_id();
		vo.setUser_id(id);
		
		CommuteVO getCommute = commuteService.getCommute(vo);
		
		if ( getCommute == null ) {
		String ccc = "x";
		model.addAttribute("ccc", ccc);
		System.out.println("-"+ ccc +"-");
		}
		if ( getCommute != null) {
			model.addAttribute("getCommute", getCommute);
			System.out.println("-"+getCommute+"-");
		}

		
		return "main";
	}
	
	@RequestMapping("/updateCommute.do")
	public String updateApproval(CommuteVO vo) {
		System.out.println(">>> 처리 - updateCommute()");
		System.out.println(" vo : " + vo);
		
		
		commuteService.updateCommute(vo);
		return "redirect:getCommuteList.do";
	}
	
	
	
}
