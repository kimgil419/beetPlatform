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
		;
	}

	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.user_get", vo);
	}

	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.user_insert", vo);
	}

	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.user_update", vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserList", vo) ;
	}
}
