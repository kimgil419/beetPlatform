package com.beetoffice.approval;

import java.util.List;

import com.beetoffice.approval.PagingProcessApproval;

public interface ApprovalService {
	//CRUD 기능 구현 메소드 정의
	void insertApproval(ApprovalVO vo); //입력
	void updateApproval(ApprovalVO vo); //수정
	void refuseApproval(ApprovalVO vo); //수정
	void deleteApproval(ApprovalVO vo); //삭제
	ApprovalVO getApproval(ApprovalVO vo); //조회(상세조회)
	List<ApprovalVO> getApprovalListDone(PagingProcessApproval pages); //지난 문서
	List<ApprovalVO> getApprovalListMy(PagingProcessApproval pages); //내가쓴 글 조회(글목록)
	List<ApprovalVO> getApprovalList(ApprovalVO vo); //결재 문서
	List<ApprovalVO> getApprovalListMainSerial(ApprovalVO vo);
	List<ApprovalVO> getApprovalListMainParallel(ApprovalVO vo); //메인 페이지용
	int getTotalPostDone(PagingProcessApproval pages);
	int getTotalPostMy(PagingProcessApproval pages);

	
	
}
