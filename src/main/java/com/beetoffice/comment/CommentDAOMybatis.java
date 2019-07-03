package com.beetoffice.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CommentDAOMybatis")
public class CommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertComment(CommentVO vo) {
		System.out.println("===> Mybatis로 insertComment() 실행");
		mybatis.insert("CommentDAO.insertComment", vo);
	}

	public List<CommentVO> getCommentList(CommentVO vo) {
		System.out.println("===> Mybatis로 getComment() 실행");
		return mybatis.selectList("CommentDAO.getCommentList", vo);
	}

}
