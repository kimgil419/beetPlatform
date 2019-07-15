package com.beetoffice.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetoffice.approval.ApprovalService;
import com.beetoffice.approval.ApprovalVO;
import com.beetoffice.approval.PagingProcessApproval;


//@Service : @Component를 상속받아 만든 
//비즈니스 로직처리 서비스 영역에 사용
@Service("ApprovalService")
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	
	private ApprovalDAO approvalDAO;
	
	public ApprovalServiceImpl() {
		System.out.println(">> ApprovalServiceImpl 객체 생성");
	}

	public void insertApproval(ApprovalVO vo) {
		approvalDAO.insertApproval(vo);
	}

	@Override
	public void updateApproval(ApprovalVO vo) {
		approvalDAO.updateApproval(vo);
	}
	@Override
	public void refuseApproval(ApprovalVO vo) {
		approvalDAO.refuseApproval(vo);
	}

	@Override
	public void deleteApproval (ApprovalVO vo) {
		approvalDAO.deleteApproval(vo);
	}

	@Override
	public ApprovalVO getApproval(ApprovalVO vo) {
		return approvalDAO.getApproval(vo);
	}
	
	@Override
	public List<ApprovalVO> getApprovalList(ApprovalVO vo) {
		return approvalDAO.getApprovalList(vo);
	}

	@Override
	public List<ApprovalVO> getApprovalListDone(PagingProcessApproval pages) {
		return approvalDAO.getApprovalListDone(pages);
	}
	
	@Override
	public List<ApprovalVO> getApprovalListMy(PagingProcessApproval pages) {
		return approvalDAO.getApprovalListMy(pages);
	}
	
	
	@Override
	public int getTotalPostDone(PagingProcessApproval pages) {
		System.out.println(">> Service: getTotalPostDone()");
		return approvalDAO.getTotalPostDone(pages);
	}
	
	@Override
	public int getTotalPostMy(PagingProcessApproval pages) {
		System.out.println(">> Service: getTotalPostDone()");
		return approvalDAO.getTotalPostMy(pages);
	}

	
}














