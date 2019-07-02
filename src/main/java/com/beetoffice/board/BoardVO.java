package com.beetoffice.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE BOARD (
	SEQ NUMBER(5) PRIMARY KEY,
	TITLE VARCHAR2(200),
	WRITER VARCHAR2(20),
	CONTENT VARCHAR2(2000),
	REGDATE DATE DEFAULT SYSDATE,
	CNT NUMBER(5) DEFAULT 0
);
 */
@ToString
public class BoardVO {
	@Getter @Setter
	private int seq,cnt;
	@Getter @Setter
	private String t_title,user_name,t_content,t_regdate,user_id,dept,t_password,t_noti,user_position,t_img;
	
	
	
	
	
	//검색조건용 필드 추가
//	private String searchCondition;
//	private String searchKeyword;
	
	//파일 관련 필드 추가
	@Getter @Setter
	private MultipartFile t_imgs;
	
	
	
}










