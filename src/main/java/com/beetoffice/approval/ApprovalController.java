package com.beetoffice.approval;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	
	@RequestMapping("/getApproval.do")
	public String getApproval(ApprovalVO vo, Model model) {
		System.out.println(">>> 조회 처리 - getApproval()");
		
		model.addAttribute("approval", approvalService.getApproval(vo)); 
		System.out.println(approvalService.getApproval(vo));
		return "approval/getApproval";
	}
	
	
	@RequestMapping("/getApprovalList.do")
	public String getApprovalList(ApprovalVO vo, 
			Model model) {
		System.out.println(">>> �? 목록 조회 처리- getApprovalList()");
		System.out.println("condition: " + vo.getSearchCondition());
		System.out.println("keyword: -" + vo.getSearchKeyword() + "-");
		
		//null체크 ?�� 초기�? ?��?��
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리?�� condition: " + vo.getSearchCondition());
		System.out.println("null처리?�� keyword: -" + vo.getSearchKeyword() + "-");
		
		
		//?���? ?��?��?? 조회(�??��조건 ?��?��)
		List<ApprovalVO> approvalList = approvalService.getApprovalList(vo);
		
		model.addAttribute("approvalList", approvalList);
		
		return "approval/getApprovalList";
	}	
	
	@RequestMapping("/insertApproval.do")
	public String insertApproval(ApprovalVO vo) 
			throws IllegalStateException, IOException {
		System.out.println(">>> �? ?���? 처리 - insertApproval()");
			
		approvalService.insertApproval(vo);
		return "redirect:getApprovalList.do";
	}
	
	@RequestMapping("/updateApproval.do")
	public String updateApproval(@ModelAttribute("approval") ApprovalVO vo) {
		System.out.println(">>> �? ?��?�� 처리 - updateApproval()");
		System.out.println("?��?��?���? vo : " + vo);
		
		
		approvalService.updateApproval(vo);
		return "getApprovalList.do";
	}
	@RequestMapping("/refuseApproval.do")
	public String refuseApproval(@ModelAttribute("approval") ApprovalVO vo) {
		System.out.println(">>> �? ?��?�� 처리 - refuseApproval()");
		System.out.println("?��?��?���? vo : " + vo);
		
		
		approvalService.refuseApproval(vo);
		return "getApprovalList.do";
	}
	@RequestMapping("/ApprovalForm.do")
	public String ApprovalForm(ApprovalVO vo) {
		return "approval/insertApproval";
	}
	
	@RequestMapping("/deleteApproval.do")
	public String deleteApproval(ApprovalVO vo) {
		System.out.println(">>> �? ?��?�� 처리 - deleteApproval()");
		approvalService.deleteApproval(vo);
		
		return "getApprovalList.do";
	}
}
