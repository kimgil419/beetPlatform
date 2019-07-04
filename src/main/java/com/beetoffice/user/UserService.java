package com.beetoffice.user;

import java.util.List;



public interface UserService {
	//회원조회
	UserVO getUser(UserVO vo);
	
	List<UserVO> getUserList(UserVO vo);
	
	void insertUser(UserVO vo);

	void updatePassword(UserVO vo);

	int idcheck(String userid);
}
