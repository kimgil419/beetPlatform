package com.beetoffice.project;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.project.vo.ProjectVO;
import com.beetoffice.project.vo.SourceVO;

@Repository("ProjectDAO")
public class ProjectDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ProjectDAO() {
		System.out.println(">> ProjectDAO 객체 생성");
	}
	
	public List<ProjectVO> getProjectList(PagingProcess pages) {
		return mybatis.selectList("ProjectDAO.getProjectList", pages);
	}
	
	public List<ProjectVO> getProjectList() {
		return mybatis.selectList("ProjectDAO.getProjectListMain");
	}
	
	public ProjectVO getProject(ProjectVO vo) {
		return mybatis.selectOne("ProjectDAO.getProject", vo);
	}

	public void deleteProject(ProjectVO vo) {
		mybatis.delete("ProjectDAO.deleteProject", vo);
	}

	public void insertProject(ProjectVO vo) {
		mybatis.insert("ProjectDAO.insertProject", vo);
	}
	
	public void updateProject(ProjectVO vo) {
		mybatis.update("ProjectDAO.updateProject", vo);
	}
	
	public SourceVO getSource(SourceVO vo) {
		vo = mybatis.selectOne("ProjectDAO.getSource", vo);
		return vo;
	}

	public List<SourceVO> getSourceList(ProjectVO vo) {
		return mybatis.selectList("ProjectDAO.getSourceList", vo);
	}

	public ProjectVO modifyProject(ProjectVO vo) {
		return mybatis.selectOne("ProjectDAO.modifyProject", vo);
	}

	public void insertSource(SourceVO svo) {
		mybatis.insert("ProjecDAO.insertSource", svo);
	}
	
	public int getTotalPost(PagingProcess pages) {
		return mybatis.selectOne("ProjectDAO.getTotalPost", pages);
	}

	public int getProject_idx(ProjectVO vo) {
		return mybatis.selectOne("ProjectDAO.getProject_idx", vo);
	}
	
	public void insertFunction(SourceVO svo) {
		mybatis.insert("ProjectDAO.insertFunction", svo);
	}
	
	public void updateSource(SourceVO svo) {
		mybatis.update("ProjectDAO.updateSource", svo);
	}
	
	public void deleteSource(SourceVO svo) {
		mybatis.update("ProjectDAO.deleteSource", svo);
	}
	
	public List<Integer> getSource_idxList(ProjectVO vo) {
		return mybatis.selectList("ProjectDAO.getSource_idxList", vo);
	}
}
