package com.beetoffice.approval;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="ApprovalList")
@XmlAccessorType(XmlAccessType.FIELD)
public class ApprovalListVO {
	
	@XmlElement(name="approval") 
	private List<ApprovalVO> ApprovalList;

	public List<ApprovalVO> getApprovalList() {
		return ApprovalList;
	}

	public void setApprovalList(List<ApprovalVO> approvalList) {
		this.ApprovalList = approvalList;
	}
}




















