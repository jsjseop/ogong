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
import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.TestStudyService;
import com.ogong.service.studyroom.StudyroomService;


@Controller
@RequestMapping("/selfStudy/*")
public class SelfStudyController {
	
	@Autowired
	private TestStudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	public SelfStudyController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("addStudy")
	public String addStudy(@RequestParam("studyType") String studyType, Model model) throws Exception{
		
		System.out.println("/studyController/addStudy : GET");
		
		model.addAttribute("studyType", studyType);
		
		return "/studyView/addSelfStudy";
	}
	
	@PostMapping("addStudy")
	public String addStudy(@ModelAttribute("study") Study study,
										@RequestParam("studyType") String studyType, 
										GroupStudyMember gsm,
										Calendar calendar, HttpSession session) throws Exception{
			
		System.out.println("/studyController/addStudy : POST");
		
		User user = new User();
		//user.setEmail(((User)session.getAttribute("user")).getEmail());
		user.setEmail("user01");
		
		study.setStudyMaker(user);
		studyService.addStudy(study);
		
		if(studyType.equals("group")) {
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
		
		return "redirect:https://wnstjqtest.herokuapp.com/"+ study.getStudyNo();
	}
	
	@GetMapping("getStudy")
	public String getStudy(@RequestParam("studyNo") int studyNo,
										@RequestParam("studyType") String studyType, Model model) throws Exception{
		
		System.out.println("studyController/getStudy : GET");
		
		Study study = new Study();
		study = studyService.getStudy(studyNo);
		
		model.addAttribute("study", study);
		System.out.println(studyType);
		if(studyType.equals("self")) {
			return "/studyView/entranceSelfStudy";
		}else {
			return "/studyView/getStudy";
		}
		
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
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("studyType", studyType);
		model.addAttribute("search", search);
		
		return "/studyView/listSelfStudy";
	}
	
}
