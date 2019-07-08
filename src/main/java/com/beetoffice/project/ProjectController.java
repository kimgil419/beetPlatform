package com.beetoffice.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beetoffice.project.vo.ProjectVO;
import com.beetoffice.project.vo.SourceVO;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("프로젝트명", "project_name");
		conditionMap.put("담당자", "project_manager");
		conditionMap.put("진행상황", "project_progress");
		
		return conditionMap;
	}
	
	@RequestMapping("getProjectList.do")
	public String getProjectSearchList(ProjectVO vo, PagingProcess pages, Model model) {
		System.out.println(">> Controller: getProjectList()");
		
		pages.setTotalPost(projectService.getTotalPost(pages));
		
		List<ProjectVO> projectList = projectService.getProjectList(pages);
		model.addAttribute("projectList", projectList);
		model.addAttribute("pages", pages);
		
		return "project/getProjectList";
	}
	
	@RequestMapping("getProject.do")
	public String getProject(ProjectVO vo, Model model) {
		System.out.println(">> Controller: getProject()");
		
		model.addAttribute("project", projectService.getProject(vo));
		model.addAttribute("sourceList", projectService.getSourceList(vo));
		
		return "project/getProject";
	}
	
	@RequestMapping("deleteProject.do")
	public String deleteProject(ProjectVO vo) {
		System.out.println(">> Controller: deleteProject()");
		
		projectService.deleteProject(vo);
		
		return "redirect:getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null";
	}
	
	@RequestMapping("insertProject.do")
	public String insertProject(ProjectVO vo, SourceVO svo, @RequestParam String[] user_id,
			@RequestParam String[] source_name, @RequestParam String[] source_progress) {
		System.out.println(">> Controller: insertProject()");
		
		projectService.insertProject(vo);
		
		int project_idx = projectService.getProject_idx(vo);
		for (int i = 0; i < user_id.length; i++) {
			svo.setProject_idx(project_idx);
			svo.setUser_id(user_id[i]);
			svo.setSource_name(source_name[i]);
			svo.setSource_progress(source_progress[i]);
			projectService.insertFunction(svo);
		}
		
		return "redirect:getProjectList.do?currentPage=1&searchCondition=null&searchKeyword=null";
	}
	
	@RequestMapping("getSource.do")
	public String getSource(SourceVO vo, Model model) {
		System.out.println(">> Controller: getSource()");
		
		model.addAttribute("source", projectService.getSource(vo));
		
		return "project/getSource";
	}
	
	@RequestMapping("modifyProject.do")
	public String modifyProject(ProjectVO vo, Model model) {
		System.out.println(">> Controller: modifyProject()");
		
		model.addAttribute("project", projectService.modifyProject(vo));
		model.addAttribute("sourceList", projectService.getSourceList(vo));
		
		return "project/modifyProject";
	}
	
	@RequestMapping("updateProject.do")
	public String updateProject(ProjectVO vo, SourceVO svo, Model model, @RequestParam String[] user_id,
			@RequestParam String[] source_name, @RequestParam String[] source_progress) {
		System.out.println(">> Controller: updateProject()");
		
		projectService.updateProject(vo);
		
		int project_idx = vo.getProject_idx();
		for (int i = 0; i < user_id.length; i++) {
			svo.setProject_idx(project_idx);
			svo.setUser_id(user_id[i]);
			svo.setSource_name(source_name[i]);
			svo.setSource_progress(source_progress[i]);
			projectService.insertFunction(svo);
		}
		
		model.addAttribute("project", projectService.getProject(vo));
		
		return "forward:getProject.do";
	}
	
	@RequestMapping("writeProject.do")
	public String insertProject() {
		
		return "project/insertProject";
	}
	
	@RequestMapping("modifySource.do")
	public String modifySource(SourceVO vo, Model model) {
		System.out.println(">> Controller: modifySource()");
		
		vo = projectService.getSource(vo);
		model.addAttribute("source", vo);
		System.out.println(">>>> sourceVO: " + vo);
		return "project/modifySource";
	}
	
	@RequestMapping("updateSource.do")
	public String updateSource(SourceVO vo, Model model) {
		System.out.println(">> Controller: updateSource");
		
		projectService.updateSource(vo);
		
		return "redirect:getSource.do?source_idx=" + vo.getSource_idx();
	}
	
	@RequestMapping("/insert")
	public String insertExample() {
		
		return "project/insertExample";
	}
	@RequestMapping("/code")
	public String insertCodeExample() {
		
		return "project/insertCodeExample";
	}
	@RequestMapping("/code2")
	public String insertCodeExample2() {
		
		return "project/insertCodeExample2";
	}
	@RequestMapping("/insertFunction")
	public String insertFunction() {
		return "project/insertFunction";
	}
	
}

