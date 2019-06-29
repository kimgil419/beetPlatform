package com.beetoffice.user;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("UserDAOMybatis1")
public class UserDAOMybatis1 {
    
	@Autowired
    private SqlSessionTemplate mybatis;

	public UserDAOMybatis1() {
		System.out.println(">> uBoardDAOMybastis1 객체 생성");
	}

	// 글 상세 조회
	public UserVO getUser(UserVO vo) {
		System.out.println("===> uMybatis2로 getUser() 실행");
		return mybatis.selectOne("UserDAO.user_get", vo);
	}

	// 글 상세 조회
	public void insertUser(UserVO vo) {
		System.out.println("===> uMybatis2로 insertUser() 실행");
		mybatis.insert("UserDAO.user_insert", vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserList", vo) ;
	}
}
