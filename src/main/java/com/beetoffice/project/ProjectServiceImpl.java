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
		System.out.println(">> ProjectServiceImpl 객체 생성");
	}

	@Override
	public void insertProject(ProjectVO vo) {
		System.out.println(">> Service: insertProject()");
		projectDAO.insertProject(vo);
	}

	@Override
	public void updateProject(ProjectVO vo) {
		System.out.println(">> Service: updateProject()");
		projectDAO.updateProject(vo);
	}

	@Override
	public void deleteProject(ProjectVO vo) {
		System.out.println(">> Service: deleteProject()");
		projectDAO.deleteProject(vo);
	}

	@Override
	public ProjectVO getProject(ProjectVO vo) {
		System.out.println(">> Service: getProject()");
		return projectDAO.getProject(vo);
	}

	@Override
	public List<ProjectVO> getProjectList(PagingProcess pages) {
		System.out.println(">> Service: getProjectList()");
		return projectDAO.getProjectList(pages);
	}
	
	@Override
	public SourceVO getSource(SourceVO vo) {
		System.out.println(">> Service: getSource()");
		return projectDAO.getSource(vo);
	}

	@Override
	public List<SourceVO> getSourceList(ProjectVO vo) {
		System.out.println(">> Service: getSourceList()");
		return projectDAO.getSourceList(vo);
	}

	@Override
	public void insertSource(SourceVO svo) {
		System.out.println(">> Service: insertSource()");
		projectDAO.insertSource(svo);
	}

	@Override
	public void insertFunction(SourceVO svo) {
		System.out.println(">> Service: insertFunction()");
		projectDAO.insertFunction(svo);
	}

	@Override
	public int getTotalPost(PagingProcess pages) {
		System.out.println(">> Service: getTotalPost()");
		return projectDAO.getTotalPost(pages);
	}

	@Override
	public int getProject_idx(ProjectVO vo) {
		System.out.println(">> Service: getProject_idx()");
		return projectDAO.getProject_idx(vo);
	}

	@Override
	public void updateSource(SourceVO svo) {
		System.out.println(">> Service: updateSource()");
		projectDAO.updateSource(svo);
	}

	@Override
	public void deleteSource(SourceVO svo) {
		System.out.println(">> Service: deleteSource()");
		projectDAO.deleteSource(svo);
	}

	
	
	
}
