package com.beetoffice.user;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.beetoffice.user.UserVO;

@Repository("UserDAO")
public class UserDAO extends SqlSessionDaoSupport {

	@Autowired
	public void setSqlSessionFactory (SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public UserDAO() {
		System.out.println(">> uBoardDAOMybastis1 객체 생성");
	}

	// 글 상세 조회
	public UserVO getUser(UserVO vo) {
		System.out.println("===> uMybatis2로 getUser() 실행");
		return getSqlSession().selectOne("UserDAO.user_get", vo);
	}

	
	public void insertUser(UserVO vo) {
		System.out.println("===> uMybatis2로 insertUser() 실행");
		super.getSqlSession().insert("UserDAO.user_insert", vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		return getSqlSession().selectList("UserDAO.getUserList", vo) ;
	}
}