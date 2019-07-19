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
import com.beetoffice.searchemployee.SearchEmployeeService;
import com.beetoffice.searchemployee.SearchEmployeeVO;
import com.google.gson.Gson;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	@Autowired
	private SearchEmployeeService searchEmployeeService;
	
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
		
		if (pages.getCurrentPage() == null) {
			pages.setCurrentPage("1");
		}
		pages.setTotalPost(projectService.getTotalPost(pages));
		List<ProjectVO> projectList = projectService.getProjectList(pages);
		
		model.addAttribute("projectList", projectList);
		model.addAttribute("pages", pages);
		
		return "project/getProjectList";
	}
	
	@RequestMapping("getProject.do")
	public String getProject(ProjectVO vo, PagingProcess pages, Model model) {
		
		model.addAttribute("pages", pages);
		model.addAttribute("project", projectService.getProject(vo));
		model.addAttribute("sourceList", projectService.getSourceList(vo));
		
		return "project/getProject";
	}
	
	@RequestMapping("deleteProject.do")
	public String deleteProject(ProjectVO vo) {
		System.out.println(">> Controller: deleteProject()");
		
		projectService.deleteProject(vo);
		
		return "redirect:getProjectList.do?";
	}

	@RequestMapping(value = "insertProject.do", produces = "application/json; charset = utf8")
	public String insertProject(Model model, ProjectVO vo, SourceVO svo, @RequestParam String[] source_idx, 
			@RequestParam String[] user_id, @RequestParam String[] source_name, @RequestParam String[] source_progress) {
		
		projectService.insertProject(vo);
		
		int project_idx = projectService.getProject_idx(vo);
		for (int i = 1; i < user_id.length; i++) {
			svo.setProject_idx(project_idx);
			svo.setUser_id(user_id[i]);
			svo.setSource_name(source_name[i]);
			svo.setSource_progress(source_progress[i]);
			projectService.insertFunction(svo);
		}
		
		return "redirect:getProjectList.do?";
	}
	
	@RequestMapping(value = "writeProject.do", produces = "application/json; charset = utf8")
	public String writeProject(Model model, SearchEmployeeVO vo) {
		List<SearchEmployeeVO> employeeList = searchEmployeeService.getUserList(vo);
		Gson json = new Gson();
		
		model.addAttribute("employeeList", json.toJson(employeeList));
		
		return "project/insertProject";
	}
	
	@RequestMapping("getSource.do")
	public String getSource(SourceVO vo, Model model) {
		
		model.addAttribute("source", projectService.getSource(vo));
		
		return "project/getSource";
	}
	
	@RequestMapping("modifyProject.do")
	public String modifyProject(ProjectVO vo, Model model) {
		System.out.println(">> Controller: modifyProject()");
		
		model.addAttribute("project", projectService.getProject(vo));
		model.addAttribute("sourceList", projectService.getSourceList(vo));
		
		return "project/modifyProject";
	}
	
	@RequestMapping("updateProject.do")
	public String updateProject(ProjectVO vo, SourceVO svo, Model model, @RequestParam String[] source_idx, @RequestParam String[] user_id,
			@RequestParam String[] source_name, @RequestParam String[] source_progress) {
		
		projectService.updateProject(vo);
		
		List<Integer> list = projectService.getSource_idxList(vo); 
		for (int i = 0; i < list.size(); i++) {
			int idx = list.get(i);
			int j = 0;
			for (int k = 0; k < source_idx.length; k++) {
				if (idx == Integer.parseInt(source_idx[k])) {
					j++;
				}
			}
			if (j != 1) {
				svo.setSource_idx(idx);
				projectService.deleteSource(svo);
			}
		}
		int project_idx = vo.getProject_idx();
		for (int i = 0; i < user_id.length; i++) {
			if (source_idx[i].equalsIgnoreCase("-1")) {
				svo.setProject_idx(project_idx);
				svo.setUser_id(user_id[i]);
				svo.setSource_name(source_name[i]);
				svo.setSource_progress(source_progress[i]);
				projectService.insertFunction(svo);
			} else if (!source_idx[i].equalsIgnoreCase("-1")) {
				svo.setSource_idx(Integer.parseInt(source_idx[i]));
				svo.setProject_idx(project_idx);
				svo.setUser_id(user_id[i]);
				svo.setSource_name(source_name[i]);
				svo.setSource_progress(source_progress[i]);
				projectService.updateSource(svo);
			}
		}
		model.addAttribute("project", projectService.getProject(vo));
		
		return "forward:getProject.do";
	}
	
	@RequestMapping("modifySource.do")
	public String modifySource(SourceVO vo, Model model) {
		
		vo = projectService.getSource(vo);
		model.addAttribute("source", vo);
		
		return "project/modifySource";
	}
	
	@RequestMapping("updateSource.do")
	public String updateSource(SourceVO vo, Model model) {
		
		projectService.updateSource(vo);
		
		return "redirect:getSource.do?source_idx=" + vo.getSource_idx();
	}
	
	@RequestMapping("deleteSource.do")
	public String deleteSource(SourceVO svo) {
		System.out.println(">> Controller: deleteSource");
		
		projectService.deleteSource(svo);
		
		return "redirect:getProject.do?project_idx=" + svo.getProject_idx();
	}
	
	@RequestMapping(value="selectEmployee", produces="application/json; charset=utf8")
	public String selectEmployee(SearchEmployeeVO vo, Model model) {
		List<SearchEmployeeVO> employeeList = searchEmployeeService.getUserListForSearch(vo);
		Gson json = new Gson();
		
		model.addAttribute("employeeList", json.toJson(employeeList));
		
		return null;
	}
}

