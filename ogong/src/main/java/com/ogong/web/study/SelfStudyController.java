package com.ogong.web.study;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.TestStudyService;


@Controller
@RequestMapping("/selfStudy/*")
public class SelfStudyController {
	
	@Autowired
	private TestStudyService studyService;
	
	public SelfStudyController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("addStudy")
	public String addStudy() throws Exception{
		
		System.out.println("/studyController/addStudy : GET");
		
		return "/studyView/addStudy";
	}
	
	@PostMapping("addStudy")
	public String addStudy(@ModelAttribute("study") Study study, HttpSession session) throws Exception{
			
		System.out.println("/studyController/addStudy : POST");
		
		User user = new User();
		user.setEmail(((User)session.getAttribute("user")).getEmail());
		
		study.setStudyMaker(user);
		studyService.addStudy(study);
		
		return "redirect:https://wnstjqtest.herokuapp.com/"+ study.getStudyNo();
	}
	
	@GetMapping("getStudy")
	public String getStudy(@RequestParam("studyNo") int studyNo, Model model) throws Exception{
		
		System.out.println("studyController/getStudy : GET");
		
		Study study = new Study();
		study = studyService.getStudy(studyNo);
		
		model.addAttribute("study", study);
		
		return "/studyView/entranceStudy";
	}
	
	@RequestMapping("listStudy")
	public String listStudy(@ModelAttribute("search") Search search,
										@RequestParam("studyType") String studyType, Model model) throws Exception{
		
		System.out.println("/studyController/listStudy");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(8);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("search", search);
		searchMap.put("studyType", studyType);
		
		Map<String, Object> map = studyService.getStudyList(searchMap);
		System.out.println("map : "+map);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("studyType", studyType);
		
		return "/studyView/listStudy";
	}
	
}
