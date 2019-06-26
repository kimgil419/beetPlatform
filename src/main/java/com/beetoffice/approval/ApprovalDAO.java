package com.beetoffice.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.approval.ApprovalVO;

@Repository("ApprovalDAO")
public class ApprovalDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ApprovalDAO() {
		System.out.println(">> ApprovalDAO");
	}
	
	public void insertApproval(ApprovalVO vo) {
		System.out.println("===> ApprovalDAO insertApproval() ");
		mybatis.insert("ApprovalDAO.insertApproval", vo);
	}
	
	public void updateApproval(ApprovalVO vo) {
		System.out.println("===> ApprovalDAO  updateApproval() ");
		mybatis.update("ApprovalDAO.updateApproval", vo);
	}
	public void refuseApproval(ApprovalVO vo) {
		System.out.println("===> ApprovalDAO  refuseApproval() ");
		mybatis.update("ApprovalDAO.refuseApproval", vo);
	}
	
	public void deleteApproval(ApprovalVO vo) {
		System.out.println("===> ApprovalDAO deleteApproval() ");
		mybatis.delete("ApprovalDAO.deleteApproval", vo);
	}
	
	
	public ApprovalVO getApproval(ApprovalVO vo) {
		System.out.println(vo);
		System.out.println("===> ApprovalDAO getApproval() ");
		return mybatis.selectOne("ApprovalDAO.getApproval", vo);
	}
	
	
	public List<ApprovalVO> getApprovalList(ApprovalVO vo) {
		System.out.println("===> ApprovalDAO getApprovalList() ");
		return mybatis.selectList("ApprovalDAO.getApprovalList", vo);
	}	
}




