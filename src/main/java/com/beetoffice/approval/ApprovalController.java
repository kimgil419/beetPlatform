package com.beetoffice.approval;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller

@SessionAttributes("approval")
public class ApprovalController {
	
	
	@Autowired
	private ApprovalService approvalService;
	
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		//key: ?���?, value: TITLE
		//key: ?��?��, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}

	@RequestMapping("/Main.do")
	public String getMain(ApprovalVO vo, Model model) {
		
		return "main";
	}
	


	
	@RequestMapping("/getApproval.do")
	public String getApproval(ApprovalVO vo, Model model) {
		
		model.addAttribute("approval", approvalService.getApproval(vo)); 
		
		return "approval/getApproval";
	}
	
	
	@RequestMapping("/getApprovalList.do")
	public String getApprovalList(ApprovalVO vo, 
			Model model) {
		
		
		//null체크 ?�� 초기�? ?��?��
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		
		List<ApprovalVO> approvalList = approvalService.getApprovalList(vo);
		
		model.addAttribute("approvalList", approvalList);
		
		return "approval/getApprovalList";
	}	
	
	@RequestMapping("/insertApproval.do")
	public String insertApproval(ApprovalVO vo, HttpServletRequest request) 
			throws IllegalStateException, IOException {
		
	 System.out.println("userid1 : " + vo.getUser_id1());
	 if (vo.getUser_id1() == null || vo.getUser_id1() == "") {
		 String id1 = vo.getTo().split(",")[0];
		String id2 = vo.getTo().split(",")[1];
		String id3 = vo.getTo().split(",")[2];
		 vo.setUser_id1(id1);
		 vo.setUser_id2(id2);
		 vo.setUser_id3(id3);
		 vo.setOption("1");
	 } else {
		 vo.setOption("0");
	 }
		approvalService.insertApproval(vo);
		return "redirect:getApprovalList.do";
	}
	
	@RequestMapping("/updateApproval.do")
	public String updateApproval(@ModelAttribute("approval") ApprovalVO vo) {
	
		
		approvalService.updateApproval(vo);
		return "redirect:getApprovalList.do";
	}
	@RequestMapping("/refuseApproval.do")
	public String refuseApproval(@ModelAttribute("approval") ApprovalVO vo) {
		
		
		approvalService.refuseApproval(vo);
		return "redirect:getApprovalList.do";
	}
	@RequestMapping("/ApprovalForm.do")
	public String ApprovalForm(ApprovalVO vo) {
		return "approval/insertApproval";
	}
	
	@RequestMapping("/deleteApproval.do")
	public String deleteApproval(ApprovalVO vo) {
		
		approvalService.deleteApproval(vo);
		
		return "redirect:getApprovalList.do";
	}
}
