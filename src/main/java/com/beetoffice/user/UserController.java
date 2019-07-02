package com.beetoffice.user;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.beetoffice.searchemployee.SearchEmployeeVO;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


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
    	   
    	 
         session.setAttribute("userInfo", user);
         session.setAttribute("user_id", user.getUser_id());
         session.setAttribute("firstjoin", user.getFirstjoin());
         session.setAttribute("departure", user.getDeparture());
         session.setAttribute("user_password", user.getUser_password());
         session.setAttribute("dept", user.getDept());
         session.setAttribute("birth", user.getBirth());
         session.setAttribute("job_id", user.getJob_id());
         session.setAttribute("user_name", user.getUser_name());
         session.setAttribute("user_position", user.getUser_position());
         session.setAttribute("phone", user.getPhone());
         session.setAttribute("cphone", user.getCphone());
         session.setAttribute("user_email", user.getUser_email());
         
         return "redirect:getCommute.do";
      } else { //사용자가 없는 경우
         
         throw new IllegalArgumentException(
               "등록되지 않은 직원입니다 인사과에 문의해주세요.");
      }
   }
   
   
   @RequestMapping(value="/insertUser.do", method = {RequestMethod.GET, RequestMethod.POST})


   public String insertUser(UserVO vo) throws IllegalStateException, IOException {
      if(vo.getDeparture()==null) {
    	  return "signup";
      }
	     MultipartFile uploadFile = vo.getUser_pictures();
	     
 		System.out.println("uploadFile : " + uploadFile);
 		if (!uploadFile.isEmpty()) {//파일이 있으면
 			String fileName = uploadFile.getOriginalFilename();
 			uploadFile.transferTo(new File("C:/Users/HB04-01/git/beetPlatform/src/main/resources/static/image/" + fileName));
 			
 			vo.setUser_picture(fileName);
 		} 
	   
      userService.insertUser(vo);
      return "redirect:getCommute.do";
   }
   
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      System.out.println(">>> 로그아웃 처리 - logout()");
      
      session.invalidate();
      return "login";
   }

   @RequestMapping(value="/showEachEmployee.do", produces="application/json; charset=utf8")
   public String showEachEmployee(UserVO vo, Model model, HttpSession session){

      vo.setUser_id((String) session.getAttribute("user_id"));
      vo.setUser_password((String) session.getAttribute("user_password"));
      UserVO list = userService.getUser(vo);

      model.addAttribute("list", list);
      return "searchemployee/userPage";
   }

   @RequestMapping(value="/checkpassword.do", produces="application/json; charset=utf8")
   public @ResponseBody String checkpassword(UserVO vo, Model model, HttpSession session){

      vo.setUser_id((String) session.getAttribute("user_id"));

      UserVO list = userService.getUser(vo);
      Gson checkedpassword = new Gson();

      return checkedpassword.toJson(list);
   }

   @RequestMapping(value="/changepassword.do", produces="application/json; charset=utf8")
   public @ResponseBody void changepassword(UserVO vo, Model model, HttpSession session){

      vo.setUser_id((String) session.getAttribute("user_id"));
      userService.updatePassword(vo);

   }
}
