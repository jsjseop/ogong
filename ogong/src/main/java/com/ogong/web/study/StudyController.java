package com.ogong.web.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping( value="addStudy", method=RequestMethod.GET)
	public String addStudyView() throws Exception{
		
		System.out.println("/study/addStudy : GET");
		
		return "/study/addStudyView";
	}
	
	@RequestMapping( value="addStudy", method=RequestMethod.POST)
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
		

		return "/study/addStudy";
	}
}
