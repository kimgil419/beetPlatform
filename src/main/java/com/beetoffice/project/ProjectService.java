package com.beetoffice.project;

import java.util.List;

import com.beetoffice.project.vo.PagingVO;
import com.beetoffice.project.vo.ProjectVO;
import com.beetoffice.project.vo.SourceVO;

public interface ProjectService {
	
	void insertProject(ProjectVO vo);
	void updateProject(ProjectVO vo);
	void deleteProject(ProjectVO vo);
	ProjectVO getProject(ProjectVO vo);
	List<ProjectVO> getProjectList(PagingVO pages);
	SourceVO getSource(SourceVO vo);
	List<SourceVO> getSourceList(ProjectVO vo);
	ProjectVO modifyProject(ProjectVO vo);
//	ProjectVO getManager(int project_idx);
	
	int getTotalPost();
	int getProject_idx(ProjectVO vo);
	void insertFunction(SourceVO svo);
	void insertSource(SourceVO svo);
	void updateSource(SourceVO svo);

}
