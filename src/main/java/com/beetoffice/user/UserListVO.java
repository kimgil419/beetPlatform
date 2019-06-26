package com.beetoffice.user;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="UserList")
@XmlAccessorType(XmlAccessType.FIELD)
public class UserListVO {
	
	@XmlElement(name="user") 
	private List<UserVO> UserList;

	public List<UserVO> getUserList() {
		return UserList;
	}

	public void setUserList(List<UserVO> userList) {
		this.UserList = userList;
	}
}




















