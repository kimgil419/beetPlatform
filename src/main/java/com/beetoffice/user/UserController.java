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
      return "main";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      System.out.println(">>> 로그아웃 처리 - logout()");
      
      session.invalidate();
      return "login";
   }   
}
