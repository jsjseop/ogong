package com.ogong.web.study;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogong.common.Search;
import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.CamStudyMember;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.LearningHistory;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.learningHistory.LearningHistoryService;
import com.ogong.service.study.CamStudyService;
import com.ogong.service.study.TestStudyService;
import com.ogong.service.studyroom.StudyroomService;

@CrossOrigin(origins = "*", maxAge = 3600)
@Controller
@RequestMapping("/selfStudy/*")
public class SelfStudyController {
	
	@Autowired
	private TestStudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	@Autowired
	private CamStudyService camStudyService;
	
	@Autowired
	private LearningHistoryService learningHistoryService;
	
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
			//studyroomService.addGSMember(gsm);
			
			calendar.setStudy(study);
			calendar.setCalendarStartDate(study.getStudyStartDate());
			calendar.setCalendarEndDate(study.getStudyEndDate());
			
			studyroomService.addCalendar(calendar);
			
			return "redirect:/study/getStudy?studyNo="+study.getStudyNo();
		}
		
		return "redirect:https://wnstjqtest.herokuapp.com/"+ study.getStudyNo()+"/"+user.getEmail();
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
	
	@GetMapping("entranceStudy")
	public String entranceStudy(@RequestParam("studyNo") int studyNo, HttpSession session) throws Exception{
		
		CamStudyMember csm = new CamStudyMember();
		User user = ((User)session.getAttribute("user"));
		csm.setEmail(user.getEmail());
		csm.setNickname(user.getNickname());
		csm.setStudyNo(studyNo);
		
		studyService.entranceStudy(studyNo);
		camStudyService.addCamStudyMember(csm);
		
		return "redirect:https://wnstjqtest.herokuapp.com/"+ studyNo+"/"+user.getEmail();
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
	
	@Transactional
	@PostMapping("leaveStudy")
	@ResponseBody
	public LearningHistory leaveStudy(@RequestBody LearningHistory learningHistory) throws Exception{
				
		int userTargetTime = (camStudyService.getUser(learningHistory.getEmail())).getUserTargetTime();
		String todayLearningTime = (learningHistoryService.getTodayLearningTime(learningHistory.getEmail())).substring(1, 2);
		
		if(Integer.parseInt(todayLearningTime) < userTargetTime) {
			learningHistoryService.addLearningHistory(learningHistory);
			String todayLearningTimePlus = (learningHistoryService.getTodayLearningTime(learningHistory.getEmail())).substring(1, 2);
			
			if(Integer.parseInt(todayLearningTimePlus) >= userTargetTime) {
				//바나나 1개 update, 바나나기록 insert
			}
		} else {
			learningHistoryService.addLearningHistory(learningHistory);
		}
		
		camStudyService.deleteCamStudyMember(learningHistory);
		
		int studyNo = learningHistory.getStudyNo();
		
		if((studyService.getStudy(studyNo)).getStudyType().equals("self")) {
			studyService.leaveStudy(studyNo);
			learningHistory.setEmail("http://127.0.0.1:5050/integration/mainPage");
		}else {
			learningHistory.setEmail("location:main");
		}
		
		return learningHistory;
	}
	
}
