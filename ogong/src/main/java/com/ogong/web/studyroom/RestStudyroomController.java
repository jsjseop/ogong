package com.ogong.web.studyroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;


@RestController
@RequestMapping("/studyroom/*")
public class RestStudyroomController {
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	public RestStudyroomController(){
		System.out.println(this.getClass());
	}
	
	@PostMapping("json/studyroom/applyParticipation")
	public GroupStudyMember updateApproval(	@RequestBody GroupStudyMember gsm) throws Exception{
		
		studyroomService.applyParticipation(gsm.getMember().getEmail());
		
		return gsm;
	}
	
	@PostMapping("json/studyroom/rejectParticipation")
	public void rejectApproval ( @RequestBody GroupStudyMember gsm) throws Exception{
		
		studyroomService.rejectParticipation(gsm.getGroupStudyMemberNo());
	}
	
}
