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

import com.beetoffice.project.vo.PagingVO;
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
		
		return conditionMap;
	}
	
	@RequestMapping("getProjectList.do")
	public String getProjectSearchList(ProjectVO vo, Model model, @RequestParam String currentPage, @RequestParam String searchCondition, @RequestParam String searchKeyword) {
		System.out.println(">> Controller: getProjectList()");
		System.out.println(">>>> searchCondition: " + searchCondition);
		System.out.println(">>>> searchKeyword: " + searchKeyword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		
		int totalPost = projectService.getTotalPost(map);
		PagingVO pages = new PagingVO(totalPost, Integer.parseInt(currentPage));
		
		pages.setSearchCondition(searchCondition);
		pages.setSearchKeyword(searchKeyword);
		List<ProjectVO> projectList = projectService.getProjectList(pages);
		
//		int i = 0;
//		for (ProjectVO pvo : projectList) {
//			System.out.println(i + ": " + pvo.toString());
//			i++;
//		}
		
		model.addAttribute("projectList", projectList);
		model.addAttribute("pages", pages);
		
		System.out.println(">>>> pages: " + pages);
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
		System.out.println(">>> insertProject완료");
		
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
		
		return "project/modifyProject";
	}
	
	@RequestMapping("updateProject.do")
	public String updateProject(ProjectVO vo, Model model) {
		System.out.println(">> Controller: updateProject()");
		
		projectService.updateProject(vo);
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
		
		model.addAttribute("source", projectService.getSource(vo));
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
	
}

