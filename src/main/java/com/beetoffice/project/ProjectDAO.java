package com.beetoffice.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.project.vo.PagingVO;
import com.beetoffice.project.vo.ProjectVO;
import com.beetoffice.project.vo.SourceVO;

@Repository("ProjectDAO")
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ProjectDAO() {
		System.out.println(">> ProjectDAO 객체 생성");
	}
	
	public List<ProjectVO> getProjectList(PagingVO pages) {
		System.out.println(">> DAO: getProjectList()");
		
		return mybatis.selectList("ProjectDAO.getProjectList", pages);
	}
	
	public ProjectVO getProject(ProjectVO vo) {
		System.out.println(">> DAO: getProject()");
		
		return mybatis.selectOne("ProjectDAO.getProject", vo);
	}

	public void deleteProject(ProjectVO vo) {
		System.out.println(">> DAO: deleteProject()");
		mybatis.delete("ProjectDAO.deleteProject", vo);
	}

	public void insertProject(ProjectVO vo) {
		System.out.println(">> DAO: insertProject()");
		mybatis.insert("ProjectDAO.insertProject", vo);
	}
	
	public void updateProject(ProjectVO vo) {
		System.out.println(">> DAO: updateProject()");
		mybatis.update("ProjectDAO.updateProject", vo);
	}
	
	public SourceVO getSource(SourceVO vo) {
		System.out.println(">> DAO: getSource()");
		vo = mybatis.selectOne("ProjectDAO.getSource", vo);
		System.out.println("DAO vo: " + vo);
		return vo;
	}

	public List<SourceVO> getSourceList(ProjectVO vo) {
		System.out.println(">> DAO: getSourceList()");
		return mybatis.selectList("ProjectDAO.getSourceList", vo);
	}

	public ProjectVO modifyProject(ProjectVO vo) {
		System.out.println(">> DAO: modifyProject()");
		return mybatis.selectOne("ProjectDAO.modifyProject", vo);
	}

	public void insertSource(SourceVO svo) {
		System.out.println(">> DAO: insertSource()");
		mybatis.insert("ProjecDAO.insertSource", svo);
	}
	
	public int getTotalPost() {
		System.out.println(">> DAO: getTotalPost()");
		return mybatis.selectOne("ProjectDAO.getTotalPost");
	}

	public int getProject_idx(ProjectVO vo) {
		System.out.println(">> DAO: getProject_idx()");
		return mybatis.selectOne("ProjectDAO.getProject_idx", vo);
	}
	
	public void insertFunction(SourceVO svo) {
		System.out.println(">> DAO: insertSource()");
		mybatis.insert("ProjectDAO.insertFunction", svo);
	}
}
