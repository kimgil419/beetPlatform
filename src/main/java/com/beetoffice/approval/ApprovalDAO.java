package com.beetoffice.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.approval.ApprovalVO;
import com.beetoffice.approval.PagingProcessApproval;

@Repository("ApprovalDAO")
public class ApprovalDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ApprovalDAO() {
		
	}
	
	public void insertApproval(ApprovalVO vo) {
		
		mybatis.insert("ApprovalDAO.insertApproval", vo);
	}
	
	public void updateApproval(ApprovalVO vo) {
		
		mybatis.update("ApprovalDAO.updateApproval", vo);
	}
	public void refuseApproval(ApprovalVO vo) {
		
		mybatis.update("ApprovalDAO.refuseApproval", vo);
	}
	
	public void deleteApproval(ApprovalVO vo) {
		
		mybatis.delete("ApprovalDAO.deleteApproval", vo);
	}
	
	
	public ApprovalVO getApproval(ApprovalVO vo) {
		
		return mybatis.selectOne("ApprovalDAO.getApproval", vo);
	}
	
	
	public List<ApprovalVO> getApprovalList(ApprovalVO vo) {
		;
		return mybatis.selectList("ApprovalDAO.getApprovalList", vo);
	}
	
	public List<ApprovalVO> getApprovalListDone(PagingProcessApproval pages) {
		System.out.println("List" + pages);
		return mybatis.selectList("ApprovalDAO.getApprovalListDone", pages);
	}
	public List<ApprovalVO> getApprovalListMy(PagingProcessApproval vo) {
		
		return mybatis.selectList("ApprovalDAO.getApprovalListMy", vo);
	}

	public int getTotalPostDone(PagingProcessApproval pages) {
		System.out.println("dao"+pages);
		return mybatis.selectOne("ApprovalDAO.getTotalPostDone", pages);
	}

	public int getTotalPostMy(PagingProcessApproval pages) {
		return mybatis.selectOne("ApprovalDAO.getTotalPostMy", pages);
	}	
	
	public List<ApprovalVO> getApprovalListMainSerial(ApprovalVO vo) {
		return mybatis.selectList("ApprovalDAO.getApprovalListMainSerial", vo);
	}
	public List<ApprovalVO> getApprovalListMainParallel(ApprovalVO vo) {
		return mybatis.selectList("ApprovalDAO.getApprovalListMainParallel", vo);
	}
}




