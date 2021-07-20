package com.ogong.web.studyroom;

import java.util.List;
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

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;


@Controller
@RequestMapping("/studyroom/*")
public class StudyroomController {
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	public StudyroomController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getStudyRoom")
	public String getStudyRoom ( @RequestParam("studyNo") String studyNo,
								@RequestParam("email") String email,
								Model model, HttpSession session) throws Exception{
		
		model.addAttribute("studyNo", studyNo);
		model.addAttribute("email", email);
		
		return "/studyroomView/getStudyRoom";
	}
	
//	
	@GetMapping("chat")
	public String chat( @RequestParam("email") String email,
						@RequestParam("studyNo") String studyNo,
						Model model) throws Exception{
		model.addAttribute("studyNo", studyNo);
		model.addAttribute("email", email);
		return "/studyroomView/chat";
	}
	
	@GetMapping("listParticipation")
	public String listParticipation( @RequestParam("studyNo") int studyNo,
										Model model) throws Exception{
		
		Map<String, Object> map = studyroomService.getParticipationList(studyNo);
		
		List<Object> list = (List<Object>)map.get("list");
		int totalCount = (Integer)map.get("totalCount");
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("studyNo", studyNo);		
		return "/studyroomView/listParticipation";
	}
	
	@GetMapping("listGSMember")
	public String listGSMember( @RequestParam("studyNo") int studyNo,
									Model model) throws Exception{
		
		
		List<GroupStudyMember> list = studyroomService.getGSMemberList(studyNo);
		
		model.addAttribute("list", list);
		model.addAttribute("studyNo", studyNo);
		
		return "/studyroomView/listGroupStudyMember";
	}
	
	@GetMapping("getStudyroomInfo")
	public String getStudy ( @RequestParam("studyNo") int studyNo,
								Model model ) throws Exception{
		
		
		model.addAttribute("study", studyService.getStudy(studyNo));
		
		return "/studyroomView/getStudyRoomInfo";
	}
	
	@GetMapping("updateStudy")
	public String updateStudyView ( @RequestParam("studyNo") int studyNo,
									Model model) throws Exception{
		
		model.addAttribute("study", studyService.getStudy(studyNo));
		
		return "/studyroomView/updateStudyRoom";
	}
	
	@PostMapping("updateStudy")
	public String updateStudy( @ModelAttribute("study") Study study) throws Exception {
		
		studyroomService.updateStudy(study);
		
		return "/studyroomView/getStudyRoomInfo";
	}
	
	@PostMapping("addAttendance")
	public String addAttendance()throws Exception{
		return null;
	}
}
