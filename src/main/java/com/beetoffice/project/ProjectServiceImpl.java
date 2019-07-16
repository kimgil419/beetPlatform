package com.beetoffice.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetoffice.project.vo.ProjectVO;
import com.beetoffice.project.vo.SourceVO;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDAO projectDAO;
	
	public ProjectServiceImpl() {
	}

	@Override
	public void insertProject(ProjectVO vo) {
		projectDAO.insertProject(vo);
	}

	@Override
	public void updateProject(ProjectVO vo) {
		projectDAO.updateProject(vo);
	}

	@Override
	public void deleteProject(ProjectVO vo) {
		projectDAO.deleteProject(vo);
	}

	@Override
	public ProjectVO getProject(ProjectVO vo) {
		return projectDAO.getProject(vo);
	}

	@Override
	public List<ProjectVO> getProjectList(PagingProcess pages) {
		return projectDAO.getProjectList(pages);
	}
	
	@Override
	public List<ProjectVO> getProjectList() {
		return projectDAO.getProjectList();
	}

	@Override
	public SourceVO getSource(SourceVO vo) {
		return projectDAO.getSource(vo);
	}

	@Override
	public List<SourceVO> getSourceList(ProjectVO vo) {
		return projectDAO.getSourceList(vo);
	}

	@Override
	public void insertSource(SourceVO svo) {
		projectDAO.insertSource(svo);
	}

	@Override
	public void insertFunction(SourceVO svo) {
		projectDAO.insertFunction(svo);
	}

	@Override
	public int getTotalPost(PagingProcess pages) {
		return projectDAO.getTotalPost(pages);
	}

	@Override
	public int getProject_idx(ProjectVO vo) {
		return projectDAO.getProject_idx(vo);
	}

	@Override
	public void updateSource(SourceVO svo) {
		projectDAO.updateSource(svo);
	}

	@Override
	public void deleteSource(SourceVO svo) {
		projectDAO.deleteSource(svo);
	}

	@Override
	public List<Integer> getSource_idxList(ProjectVO vo) {
		System.out.println(">> Service: getSource_idxList()");
		return projectDAO.getSource_idxList(vo);
	}
	
	
	
	
	
}
