package com.beetoffice.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
   @Autowired
   private UserService userService;
   
   @ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		//key: ?���?, value: TITLE
		//key: ?��?��, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("이름", "NAME");
		conditionMap.put("내선번호", "PHONE");
		conditionMap.put("휴대폰", "CPHONE");
		conditionMap.put("부서", "DEPT");
		conditionMap.put("직급", "POSITION");
		conditionMap.put("직무", "JOB_ID");
		return conditionMap;
	}
   
   @RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, 
			Model model) {
		
		System.out.println(">>>  목록 조회 처리- getUserList()");
		System.out.println("condition: " + vo.getSearchCondition());
		System.out.println("keyword: -" + vo.getSearchKeyword() + "-");
		
		//null체크 ?�� 초기�? ?��?��
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("NAME");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리 condition: " + vo.getSearchCondition());
		System.out.println("null처리 keyword: -" + vo.getSearchKeyword() + "-");
	
		List<UserVO> userList = userService.getUserList(vo);
		
		model.addAttribute("userList", userList);
		
		return "employee.jsp";
	}	

   
   @RequestMapping(value="/login.do", method=RequestMethod.POST) 
   public String login(UserVO vo, 
         HttpSession session) {//UserVO : Command 객체
      System.out.println(">> 로그인 처리");
      System.out.println("전달받은 vo: " + vo);
      
      
      //예외처리를 위해 예외 발생 시키기
            if (vo.getUser_id() == null || vo.getUser_id().equals("")) {
               throw new IllegalArgumentException(
                     "아이디는 반드시 입력해야 합니다.");
            }
      
      UserVO user = userService.getUser(vo);
      
      if (user != null) { //사용자가 존재하는 경우
    	   
    	 
         session.setAttribute("userName", user); 
         return "main";
      } else { //사용자가 없는 경우
         
         throw new IllegalArgumentException(
               "등록되지 않은 직원입니다 인사과에 문의해주세요.");
      }
   }
   
   
   @RequestMapping(value="/login_insert.do", method=RequestMethod.POST) 
   public String insertUser(UserVO vo) {
      
      userService.insertUser(vo);
      return "main.jsp";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      System.out.println(">>> 로그아웃 처리 - logout()");
      
      session.invalidate();
      return "login.jsp";
   }   
}
