package com.beetoffice.dpboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dpCommentService")
public class DpCommentServiceImpl implements DpCommentService {
    
	@Autowired
    DpCommentDAOMybatis commentDAO;
	
	public DpCommentServiceImpl() {
		System.out.println(">> CommentServiceImpl 객체 생성");
	}



	@Override
	public List<DpCommentVO> dpgetCommentList(DpCommentVO vo) {
		return commentDAO.dpgetCommentList(vo);
	}



}
