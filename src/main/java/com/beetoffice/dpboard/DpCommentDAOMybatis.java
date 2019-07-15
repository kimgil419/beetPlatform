package com.beetoffice.dpboard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("DpCommentDAOMybatis")
public class DpCommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	


	public List<DpCommentVO> dpgetCommentList(DpCommentVO vo) {
		System.out.println("===> Mybatis로 getComment() 실행");
		return mybatis.selectList("CommentDAO.dpgetCommentList", vo);
	}


}
