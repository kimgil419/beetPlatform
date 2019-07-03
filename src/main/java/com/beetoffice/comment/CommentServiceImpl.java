package com.beetoffice.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
    
	@Autowired
    CommentDAOMybatis commentDAO;
	
	public CommentServiceImpl() {
		System.out.println(">> CommentServiceImpl 객체 생성");
	}

	@Override
	public void insertComment(CommentVO vo) {
		commentDAO.insertComment(vo);
		
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		return commentDAO.getCommentList(vo);
	}

}
