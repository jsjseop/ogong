package com.ogong.web.studyroom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ogong.service.banana.BananaService;
import com.ogong.service.domain.Banana;
import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationService;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;


@RestController
@RequestMapping("/studyroom/*")
public class RestStudyroomController {
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	@Autowired
	private BananaService bananaService;
	
	@Autowired
	private IntegrationService integrationService;
	
	
	public RestStudyroomController(){
		System.out.println(this.getClass());
	}
	
	//신청
	@GetMapping("json/applyParticipation/{email}")
	public String updateApproval( @PathVariable String email) throws Exception{
		
		studyroomService.applyParticipation(email);
		
		return "성공";
	}
	
	//거절
	@GetMapping("json/rejectParticipation/{email}")
	public String rejectApproval ( @PathVariable String email) throws Exception{
		
		studyroomService.rejectParticipation(email);
		
		return "성공";
	}
	
	//출석체크 
	@GetMapping("json/addAttendance/{studyNo}")
	public String addAttendance (  @PathVariable int studyNo,
									HttpSession session) throws Exception {
		//바나나를 줘 봅시다~
		User user = (User)session.getAttribute("user");
		User bananaUser = new User();
		Banana banana = new Banana();
		banana.setBananaEmail(user);
		banana.setBananaAmount(5);
		banana.setBananaHistory("출석체크로 인한 바나나 적립");
		banana.setBananaCategory("1");
		bananaService.addBanana(banana);
		bananaUser.setEmail(user.getEmail());
		bananaUser.setBananaCount(5);
		bananaService.updateAcquireBanana(bananaUser);
		user.setBananaCount(user.getBananaCount()-5);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", ((User)session.getAttribute("user")).getEmail());
		map.put("studyNo", studyNo);
		
		String result = studyroomService.checkAttendance(map);
		if(result == null) {
			studyroomService.addAttendance(map);
		}
		return result;
	}
	
	
	@PostMapping("json/checkDuplication")
	public boolean checkDuplication ( @RequestBody Study study,
										GroupStudyMember gsm,
										HttpSession session) throws Exception{
		
		gsm.setStudy(study);
		gsm.setMember((User)session.getAttribute("user"));
			
		boolean result = studyroomService.getGSMember(gsm) != null ? true : false;
		//System.out.println("여기까지 잘 왔니??");
		return result;
	}
	
	
	@GetMapping("json/getCalendarList/{studyNo}")
	public List<Calendar> getCalendarList ( @PathVariable int studyNo) throws Exception{

	
		return studyroomService.getCalendarList(studyNo);
	}
	
	@PostMapping("json/updateCalendar")
	public Boolean updateCalendar (@RequestBody Calendar cal)throws Exception{
		Boolean result = false;
		cal.setCalendarStartDate(cal.getCalendarStartDate().substring(0,10));
		cal.setCalendarEndDate(cal.getCalendarEndDate().substring(0,10));		
		
		if(cal !=null) {
			studyroomService.updateCalendar(cal);
			result = true;
		}
		return result;
	}
	
	@GetMapping("json/deleteCalendar/{calendarNo}")
	public Boolean deleteCalendar (@PathVariable("calendarNo") int calendarNo)throws Exception{
		Boolean result = false;
		
		if(calendarNo != 0) {
			studyroomService.deleteCalendar(calendarNo);
			result = true;
		}
		
		
		return result;
	}
	
	@PostMapping("json/addCalendar")
	public Boolean addCalendar(@RequestBody List<Map<String,String>> list,
								Calendar calendar, Study study) throws Exception{
		Boolean result = false;
		
		System.out.println(list);
		ObjectMapper objectMapper = new ObjectMapper();
		
		String jasonCalendar = objectMapper.writeValueAsString(list.get(0));
		String jsonStudy = objectMapper.writeValueAsString(list.get(1));
		
		calendar = objectMapper.readValue(jasonCalendar, Calendar.class);
		
		calendar.setStudy(objectMapper.readValue(jsonStudy, Study.class));
		System.out.println("calendar : : :"+calendar);
		
		  if(calendar != null) { 
			  studyroomService.addCalendar(calendar); result = true;
		  }
		 
		
		return result;
	}
	
}
