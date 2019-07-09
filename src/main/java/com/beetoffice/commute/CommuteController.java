package com.beetoffice.commute;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.beetoffice.approval.ApprovalService;
import com.beetoffice.approval.ApprovalVO;
import com.beetoffice.board.BoardService;
import com.beetoffice.board.BoardVO;
import com.beetoffice.dpboard.DpBoardService;
import com.beetoffice.dpboard.DpBoardVO;
import com.beetoffice.user.UserVO;



@Controller

@SessionAttributes("commute")
public class CommuteController {
	@Autowired
	private CommuteService commuteService;
	

	@Autowired
	private ApprovalService approvalService;

	@Autowired //일치 타입이 하나여야만 한다, 예전에 컨트롤러 타입?으로 찾던걸 오토와이어드로 찾는다
	private BoardService boardService; //이 변수 명과 @서비스의 변수명이 같아야 서비스로 이동
	
	@Autowired //일치 타입이 하나여야만 한다, 예전에 컨트롤러 타입?으로 찾던걸 오토와이어드로 찾는다
	private DpBoardService dpboardService; //이 변수 명과 @서비스의 변수명이 같아야 서비스로 이동
	
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
		
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("user_name");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		System.out.println("null처리 condition: " + vo.getSearchCondition());
		System.out.println("null처리 keyword: -" + vo.getSearchKeyword() + "-");		
		List<CommuteVO> commuteList = commuteService.getCommuteList(vo);
		
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
		
		UserVO user = (UserVO) session.getAttribute("userInfo");
		String id = user.getUser_id();
		vo.setUser_id(id);
		
		CommuteVO getCommute = commuteService.getCommute(vo);
		
		if ( getCommute == null ) {
		String ccc = "x";
		model.addAttribute("ccc", ccc);
		}
		if ( getCommute != null) {
			model.addAttribute("getCommute", getCommute);
		}
		
		ApprovalVO vo1 = null;
		
		List<ApprovalVO> approvalList = approvalService.getApprovalList(vo1);
		
		model.addAttribute("approvalList", approvalList);

		System.out.println(approvalList);
		
		
		String dept = (String) session.getAttribute("dept");
		List<BoardVO> BdList = boardService.getBoardListm();
		
		List<DpBoardVO> DpboardList = dpboardService.dpgetBoardListm(dept);
		
		model.addAttribute("BdList", BdList);
		
		model.addAttribute("DpboardList", DpboardList);
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
