package com.ogong.web.integration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogong.common.Page;
import com.ogong.common.Search;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationService;

@Controller
@RequestMapping("/integration/*")
public class IntegrationController {
	
	@Autowired
	private IntegrationService integrationService;
	@Autowired
	private AdminService adminService;
	
	public IntegrationController() {
		System.out.println(this.getClass());
	}
	
	/*@GetMapping("addSendMessage")
	public String addSendMessage(Model model) throws Exception{
		
		System.out.println("/integration/addSendMessage : GET");
		
		User sender = new User();
		Message message = new Message();
		
		sender.setEmail("user06");
		message.setSender(sender);
		
		model.addAttribute(message);
		
		System.out.println(message+"여기는 message");
		
		return "/integrationView/addSendMessage";
		
	}*/
	
	@PostMapping("addSendMessage")
	public String addSendMessage( @ModelAttribute("message") Message message,
															 Notice notice) throws Exception{
		//로그인이 없는 결과로 sender를 지정합니다.
		User user = new User();
		user.setEmail("user06");
		message.setSender(user);
		
		
		// 알림 처리를 위해 알림 insert부터 해 볼까요
		notice.setNoticeUser(message.getReceiver());
		notice.setSender(message.getSender());
		notice.setNoticeCategory("7");
		notice.setNoticeCondition("2");
		integrationService.addNotice(notice);
		
		
		// 이제 쪽지 전송처리를 합시다.
		System.out.println("message : : : "+message);
		integrationService.addSendMessage(message);
		System.out.println(message.getSender().getEmail());
		return "redirect:/integration/listSendMessage?sender.email="+message.getSender().getEmail();
	}
	
	@RequestMapping(value="listSendMessage")
	public String listSendMessage(@ModelAttribute("search") Search search,
									@ModelAttribute("message") Message message, Model model)throws Exception {

		int pageSize = 5;
		int pageUnit = 5;
		

		System.out.println("message: : "+message);
		
		
		
		System.out.println("/integration/listSendMessage : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("message", message);
		
		Map<String,Object> result = integrationService.getlistSendMessage(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("여기는 resultPage " + resultPage);
				
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("message", message);
		
		return "/integrationView/listSendMessage";
	}
	
	@RequestMapping(value="listReceiveMessage")
	public String listReceiveMessage(@ModelAttribute("search") Search search, Model model, 
									 @ModelAttribute("message") Message message)throws Exception {
		
		int pageSize = 5;
		int pageUnit = 5;
		
		//쪽지 전송으로 session....
		User sender = new User();
		
		sender.setEmail("user06");
		message.setSender(sender);
		
		model.addAttribute(message);
		//쪽지 전송으로 session END....		
		
		System.out.println("/integration/listReceiveMessage : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("message", message);
		
		Map<String,Object> result = integrationService.getlistReceiveMessage(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("여기는 resultPage " + resultPage);
				
		model.addAttribute("list", map.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("message", message);
		
		return "/integrationView/listReceiveMessage";
	}
	
	
	@PostMapping("deleteTest")
	public int deleteTest(@RequestParam(value = "messageNo[]") List<String> messageArr, 
						  @ModelAttribute("message") Message message, Model model) throws Exception{
			
		System.out.println("테스트 삭제 실행");
			
			User user = new User();
			user.setEmail("user01");
			
			message.setReceiver(user);
			
			int result = 0;
			int messageNo = 0;
			
			if(user != null) {
				message.setReceiver(user);
				
				  for(String i : messageArr) {   
					  messageNo = Integer.parseInt(i);
					   message.setMessageNo(messageNo);
					   integrationService.deleteMessage(message.getMessageNo());
				  }
				  
				  result = 1;
					
			}
		
		return result;
		
	}
	
	public void updateTimeTask() throws Exception {
		
		User suspendDate = new User();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listType", 4);
		Map<String,Object> result = adminService.getlistTotalUser(map);
		suspendDate.getSuspendEndDate();
		
		
		Timer timer = new Timer();
		timer.schedule(null, null);
		
	}
}












