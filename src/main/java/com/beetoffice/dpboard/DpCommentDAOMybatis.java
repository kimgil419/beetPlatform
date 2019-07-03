package com.beetoffice.dpboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("DpCommentDAOMybatis")
public class DpCommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void dpinsertComment(DpCommentVO vo) {
		System.out.println("===> Mybatis로 insertComment() 실행");
		mybatis.insert("CommentDAO.dpinsertComment", vo);
	}

	public List<DpCommentVO> dpgetCommentList(DpCommentVO vo) {
		System.out.println("===> Mybatis로 getComment() 실행");
		return mybatis.selectList("CommentDAO.dpgetCommentList", vo);
	}

	public void dpdeleteComment(DpCommentVO vo) {
		System.out.println("===> Mybatis로 deleteComment() 실행");
		mybatis.delete("CommentDAO.dpdeleteComment", vo);
	}

}
