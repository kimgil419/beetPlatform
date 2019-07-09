package com.beetoffice.dpboard;

import javax.xml.bind.annotation.XmlTransient;

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
public class DpBoardVO {
	@Getter @Setter
	private int seq,cnt;
	@Getter @Setter
	private String t_title,user_name,t_content,t_regdate,user_id,dept,t_password,t_noti,user_position,t_img,li;
	@Getter @Setter
	private int begin = 0; //현재 페이지상의 시작 글번호
	@Getter @Setter
	private int end = 0; //현재 페이지상의 마지막 글번호
	
	@Getter @Setter
	@XmlTransient
	private String searchCondition;
	@Getter @Setter
	@XmlTransient
	private String searchKeyword;
	
	//검색조건용 필드 추가
//	private String searchCondition;
//	private String searchKeyword;
	
	//파일 관련 필드 추가
	@Getter @Setter
	private MultipartFile t_imgs;
	
	
	
}










