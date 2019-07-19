package com.beetoffice.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("LikeDAOMybatis")
public class LikeDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;


	public String selectReallike(LikeVO vo) {
		System.out.println("===> Mybatis2로 selectReallike() 실행");
		return mybatis.selectOne("LikeDAO.selectrs", vo);
	}


	public void insertLike(LikeVO vo) {
		System.out.println("===> Mybatis2로 insertLike() 실행");
		mybatis.insert("LikeDAO.insertrs", vo);
		
	}


	public String cselectReallike(LikeVO vo) {
		System.out.println("===> Mybatis2로 cselectReallike() 실행");
		return mybatis.selectOne("LikeDAO.selectrsc", vo);
	}


	public void updateLikemns(LikeVO vo) {
		System.out.println("===> Mybatis2로 updateLikemns() 실행");
		mybatis.update("LikeDAO.updateLikemns", vo);
	}


	public void updateLikepls(LikeVO vo) {
		System.out.println("===> Mybatis2로 updateLikemns() 실행");
		 mybatis.update("LikeDAO.updateLikepls", vo);
		
	}


	public String cselectReallikec(LikeVO vo) {
		System.out.println("===> Mybatis2로 cselectReallikec() 실행");
		return mybatis.selectOne("LikeDAO.selectrscc", vo);
	}

}
