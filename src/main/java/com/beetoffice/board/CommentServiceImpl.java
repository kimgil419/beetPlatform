package com.beetoffice.board;

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
	public List<CommentVO> getCommentList(CommentVO vo) {
		return commentDAO.getCommentList(vo);
	}



	@Override
	public void addComment(CommentVO vol) {
		commentDAO.addComment(vol);
		
	}

	@Override
	public List<CommentVO> selectBoardCommentByCode(CommentVO vol) {
		return commentDAO.selectBoardCommentByCode(vol);
	}



	@Override
	public void deleteComment(String ccd) {
		commentDAO.deleteComment(ccd);
		
	}


	

}
