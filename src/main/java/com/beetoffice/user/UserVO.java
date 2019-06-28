package com.beetoffice.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class UserVO {
	
 
 

private String user_id,firstjoin, departure, user_password, dept, birth, job_id,
                  user_name, user_position, phone, cphone, email;
 
 public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getFirstjoin() {
	return firstjoin;
}

@Override
public String toString() {
	return "UserVO [user_id=" + user_id + ", firstjoin=" + firstjoin + ", departure=" + departure + ", user_password="
			+ user_password + ", dept=" + dept + ", birth=" + birth + ", job_id=" + job_id + ", user_name=" + user_name
			+ ", user_position=" + user_position + ", phone=" + phone + ", cphone=" + cphone + ", email=" + email + "]";
}

public void setFirstjoin(String firstjoin) {
	this.firstjoin = firstjoin;
}

public String getDeparture() {
	return departure;
}

public void setDeparture(String departure) {
	this.departure = departure;
}

public String getUser_password() {
	return user_password;
}

public void setUser_password(String user_password) {
	this.user_password = user_password;
}

public String getDept() {
	return dept;
}

public void setDept(String dept) {
	this.dept = dept;
}

public String getBirth() {
	return birth;
}

public void setBirth(String birth) {
	this.birth = birth;
}

public String getJob_id() {
	return job_id;
}

public void setJob_id(String job_id) {
	this.job_id = job_id;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getUser_position() {
	return user_position;
}

public void setUser_position(String user_position) {
	this.user_position = user_position;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getCphone() {
	return cphone;
}

public void setCphone(String cphone) {
	this.cphone = cphone;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}




 
}

