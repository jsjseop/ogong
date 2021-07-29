package com.ogong.web.learningHistory;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogong.service.domain.LearningHistory;
import com.ogong.service.domain.User;
import com.ogong.service.learningHistory.LearningHistoryService;

@Controller
@RequestMapping("/learningHistory/*")
public class LearningHistoryController {

	@Autowired
	private LearningHistoryService learningHistoryService;
	
	public LearningHistoryController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping("learningHistoryPage")
	public String learningHistoryPage(HttpSession session, Model model) throws Exception {
		
		String email = ((User)session.getAttribute("user")).getEmail();
		
		String todayLearningTime = learningHistoryService.getTodayLearningTime(email);
		String averageLearningTime = learningHistoryService.getAverageLearningTime(email);
		String totalLearningTime = learningHistoryService.getTotalLearningTime(email);
		
		model.addAttribute("todayLearningTime", todayLearningTime);
		model.addAttribute("averageLearningTime", averageLearningTime);
		model.addAttribute("totalLearningTime", totalLearningTime);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String month = format.format(System.currentTimeMillis());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("month", month);
		
		List<LearningHistory> list = learningHistoryService.getLearningHistoryList(map);
		model.addAttribute("list", list);
		
		return "learningHistoryView/learningHistory";
	}
	
}
