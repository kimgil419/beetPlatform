package com.beetoffice.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
    
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/insertComment.do")
	public String insertComment(CommentVO vo, HttpSession session,@RequestParam String curPage, Model model) {
		String id = (String) session.getAttribute("user_id");
		vo.setUser_id(id);
		
		commentService.insertComment(vo);
		
		List<CommentVO> list = commentService.getCommentList(vo);
		
		model.addAttribute("cm_list", list);
		model.addAttribute("c1", curPage);
		return "board/getBoard";
	}
}
