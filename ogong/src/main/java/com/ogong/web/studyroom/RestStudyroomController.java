package com.ogong.web.studyroom;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.service.domain.GroupStudyMember;
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
	
	@PostMapping("json/applyParticipation")
	public GroupStudyMember updateApproval(	@RequestBody GroupStudyMember gsm) throws Exception{
		
		studyroomService.applyParticipation(gsm.getMember().getEmail());
		
		return gsm;
	}
	
	@PostMapping("json/rejectParticipation")
	public void rejectApproval ( @RequestBody GroupStudyMember gsm) throws Exception{
		
		studyroomService.rejectParticipation(gsm.getGroupStudyMemberNo());
	}
	
	@PostMapping("json/addAttendance")
	public String addAttendance ( @RequestParam("email") String email,
								@RequestParam("studyNo") int studyNo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("studyNo", studyNo);
		
		String a =studyroomService.checkAttendance(map);
		if(a == null) {
			studyroomService.addAttendance(map);
		}	
		
		
		return a;
	} 
	
}
