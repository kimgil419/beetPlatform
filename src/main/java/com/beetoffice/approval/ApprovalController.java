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
		conditionMap.put("제목", "a_title");
		conditionMap.put("내용", "a_content");
		
		return conditionMap;
	}


	
	@RequestMapping("/getApproval.do")
	public String getApproval(ApprovalVO vo, Model model) {
		
		model.addAttribute("approval", approvalService.getApproval(vo)); 
		
		return "approval/getApproval";
	}
	
	@RequestMapping("/getApprovalDone.do")
	public String getApprovalDone(ApprovalVO vo, Model model) {
		
		model.addAttribute("approval", approvalService.getApproval(vo)); 
		
		return "approval/getApprovalDoneMy";
	}
	@RequestMapping("/getApprovalMy.do")
	public String getApprovalMy(ApprovalVO vo, Model model) {
		
		model.addAttribute("approval", approvalService.getApproval(vo)); 
		
		return "approval/getApprovalDoneMy";
	}
	@RequestMapping("/getApprovalList.do")
	public String getApprovalList(ApprovalVO vo, /*PagingProcess pages,*/
			Model model) {
		
		//null체크 ?�� 초기�? ?��?��
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("a_title");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		
		List<ApprovalVO> approvalList = approvalService.getApprovalList(vo);
		model.addAttribute("approvalList", approvalList);

		
		return "approval/getApprovalList";
	}	
	@RequestMapping("/getApprovalListDone.do")
	public String getApprovalListDone(ApprovalVO vo, PagingProcessApproval pages,
			Model model, HttpServletRequest request) {
		
		
		
		if (pages.getSearchCondition() == null) {
			pages.setSearchCondition("a_title");
		}
		if (pages.getSearchKeyword() == null) {
			pages.setSearchKeyword("");
		}
		String user_id =  (String) request.getSession().getAttribute("user_id");
		pages.setUser_id(user_id);
	
		int totalpages = approvalService.getTotalPostDone(pages);
		pages.setTotalPost(totalpages);
		
		System.out.println(totalpages);
		
		List<ApprovalVO> approvalListDone = approvalService.getApprovalListDone(pages);
		model.addAttribute("approvalListDone", approvalListDone);
		
		System.out.println(pages);
		model.addAttribute("pages", pages);

		
	return "approval/getApprovalListDone";
	}	
	
	@RequestMapping("/getApprovalListMy.do")
	public String getApprovalListMy(ApprovalVO vo, PagingProcessApproval pages,
			Model model, HttpServletRequest request ) {
		
		
		//null체크 ?�� 초기�? ?��?��
		if (pages.getSearchCondition() == null) {
			pages.setSearchCondition("a_title");
		}
		if (pages.getSearchKeyword() == null) {
			pages.setSearchKeyword("");
		}
		
		String user_id =  (String) request.getSession().getAttribute("user_id");
		pages.setUser_id(user_id);
		
		pages.setTotalPost(approvalService.getTotalPostDone(pages));
		
		List<ApprovalVO> approvalListMy = approvalService.getApprovalListMy(pages);
		model.addAttribute("approvalListMy", approvalListMy);
		
		
		model.addAttribute("pages", pages);

		
		return "approval/getApprovalListMy";
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
