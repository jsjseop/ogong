package com.ogong.web.study;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogong.common.Search;
import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;

@Controller
@RequestMapping("/study/*")
public class StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	public StudyController(){
		System.out.println(this.getClass());
	}
	
	
	@GetMapping("addStudy")
	public String addStudyView() throws Exception{
		
		System.out.println("/study/addStudy : GET");
		
		return "/studyView/addStudy";
	}
	
	@PostMapping("addStudy")
	public String addStudy( @ModelAttribute("study") Study study,
							@ModelAttribute("user") User user,
							GroupStudyMember gsm,
							Calendar calendar) throws Exception{
		
		System.out.println("/study/addStudy : POST");
		
		
		study.setStudyMaker(user);
		
		studyService.addStudy(study);
		
		
		gsm.setStudy(study);
		gsm.setMember(user);
		gsm.setStudyRole("3");
		
		if(study.getStudyType().equals("group")) {
			gsm.setApprovalFlag("1");
		}
		studyroomService.addGSMember(gsm);
		
		calendar.setStudy(study);
		calendar.setCalendarStartDate(study.getStudyStartDate());
		calendar.setCalendarEndDate(study.getStudyEndDate());
		
		studyroomService.addCalendar(calendar);
		

		return "redirect:/study/getStudy?studyNo="+study.getStudyNo();
	}
	
	@RequestMapping("listStudy")
	public String listStudy ( @ModelAttribute("search") Search search,
								Model model) throws Exception{
		
		System.out.println("/study/listStudy 실행");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(10);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("studyType", "self");
		
		Map<String, Object> result = studyService.getStudyList(map);
			
		model.addAttribute("list", result.get("list"));
		model.addAttribute("totalCount", result.get("totalCount"));
		model.addAttribute("search", search);
		
		return "/studyView/listStudy";
	}
	
	@GetMapping("getStudy")
	public String getStudy ( @RequestParam("studyNo") int studyNo,
								Model model ) throws Exception{
		
		
		model.addAttribute("study", studyService.getStudy(studyNo));
		
		return "/studyView/getStudy";
	}
	
	
}
