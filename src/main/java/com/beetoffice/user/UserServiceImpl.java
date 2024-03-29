package com.beetoffice.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//(실습)어노테이션 설정으로 userService 이름을 갖는 객체 생성
@Service("userService")
public class UserServiceImpl implements UserService {
	//(실습) 어노테이션 설정으로 UserDAO 타입의 객체 주입
	@Autowired
	//private UserDAO userDAO;
	private UserDAOMybatis1 userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}

	@Override
	public void updatePassword(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	@Override
	public int idcheck(String userid) {
		return userDAO.idcheck(userid);
	}

}
