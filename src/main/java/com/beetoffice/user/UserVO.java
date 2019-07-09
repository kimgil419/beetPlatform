package com.beetoffice.user;



import org.springframework.web.multipart.MultipartFile;



public class UserVO {
	
 
 


private String user_id,firstjoin, departure, user_password, dept, birth, job_id,
                  user_name, user_position, phone, cphone, user_email, user_grd,user_addr,user_email1,user_email2,addr1,addr2,addr3;
	
private MultipartFile user_pictures;
    
	private String user_picture;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFirstjoin() {
		return firstjoin;
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

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_grd() {
		return user_grd;
	}

	public void setUser_grd(String user_grd) {
		this.user_grd = user_grd;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_email1() {
		return user_email1;
	}

	public void setUser_email1(String user_email1) {
		this.user_email1 = user_email1;
	}

	public String getUser_email2() {
		return user_email2;
	}

	public void setUser_email2(String user_email2) {
		this.user_email2 = user_email2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public MultipartFile getUser_pictures() {
		return user_pictures;
	}

	public void setUser_pictures(MultipartFile user_pictures) {
		this.user_pictures = user_pictures;
	}

	public String getUser_picture() {
		return user_picture;
	}

	public void setUser_picture(String user_picture) {
		this.user_picture = user_picture;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", firstjoin=" + firstjoin + ", departure=" + departure
				+ ", user_password=" + user_password + ", dept=" + dept + ", birth=" + birth + ", job_id=" + job_id
				+ ", user_name=" + user_name + ", user_position=" + user_position + ", phone=" + phone + ", cphone="
				+ cphone + ", user_email=" + user_email + ", user_grd=" + user_grd + ", user_addr=" + user_addr
				+ ", user_email1=" + user_email1 + ", user_email2=" + user_email2 + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", addr3=" + addr3 + ", user_pictures=" + user_pictures + ", user_picture=" + user_picture
				+ "]";
	}







 
}

