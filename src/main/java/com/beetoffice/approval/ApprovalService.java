package com.beetoffice.approval;

import java.util.List;

public interface ApprovalService {
	//CRUD 기능 구현 메소드 정의
	void insertApproval(ApprovalVO vo); //입력
	void updateApproval(ApprovalVO vo); //수정
	void refuseApproval(ApprovalVO vo); //수정
	void deleteApproval(ApprovalVO vo); //삭제
	ApprovalVO getApproval(ApprovalVO vo); //조회(상세조회)
	List<ApprovalVO> getApprovalList(ApprovalVO vo); //조회(글목록)

	
	
}
