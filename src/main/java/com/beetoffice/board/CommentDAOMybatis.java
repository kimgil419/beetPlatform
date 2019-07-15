package com.beetoffice.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CommentDAOMybatis")
public class CommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	


	public List<CommentVO> getCommentList(CommentVO vo) {
		System.out.println("===> Mybatis로 getComment() 실행");
		return mybatis.selectList("CommentDAO.getCommentList", vo);
	}



	public void addComment(CommentVO vol) {
		System.out.println("===> Mybatis로 addComment() 실행");
		mybatis.insert("CommentDAO.addComment", vol);
	}

	public List<CommentVO> selectBoardCommentByCode(CommentVO vol) {
		System.out.println("===> Mybatis로 selectBoardCommentByCode() 실행");
		return mybatis.selectList("CommentDAO.selectBoardCommentByCode", vol);
	}



	public void deleteComment(String ccd) {
		System.out.println("===> Mybatis로 deleteComment() 실행");
		mybatis.insert("CommentDAO.deleteComment", ccd);
		
	}

}
