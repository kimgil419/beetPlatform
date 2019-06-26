package com.beetoffice.commute;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="CommuteList")
@XmlAccessorType(XmlAccessType.FIELD)
public class CommuteListVO {
	
	@XmlElement(name="commute") 
	private List<CommuteVO> CommuteList;

	public List<CommuteVO> getCommuteList() {
		return CommuteList;
	}

	public void setApprovalList(List<CommuteVO> commuteList) {
		this.CommuteList = commuteList;
	}
}




















