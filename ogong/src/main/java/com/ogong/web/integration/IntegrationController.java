package com.ogong.web.integration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ogong.service.domain.Message;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationService;

@Controller
@RequestMapping("/integration/*")
public class IntegrationController {
	
	@Autowired
	private IntegrationService integrationService;
	
	public IntegrationController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping("addSendMessage")
	public String addSendMessage() throws Exception{
		
		System.out.println("/integration/addSendMessage : GET");
		
		return "/integrationView/addSendMessage";
		
	}
	
	@PostMapping("addSendMessage")
	public String addSendMessage( @ModelAttribute("message") Message message,
								  Model model) throws Exception{
		
		return null;
	}
	
	@RequestMapping(value="listSendMessage")
	public String listSendMessage(@ModelAttribute("search") Search search, Model model, Message message)throws Exception {
		
		int pageSize = 5;
		int pageUnit = 5;
		
		User sender = new User();
		sender.setEmail("user01");
		message.setSender(sender);
		
		
		
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
	public String listReceiveMessage(@ModelAttribute("search") Search search, Model model, Message message)throws Exception {
		
		int pageSize = 5;
		int pageUnit = 5;
		
		User receiver = new User();
		receiver.setEmail("user01");
		message.setReceiver(receiver);
		
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
	
	@PostMapping("deleteMessage")
	public void deleteMessage(@RequestParam("messageNo") int[] messageNo, HttpServletResponse response) throws Exception {

		
		System.out.println("여기는 메세지 넘버..:"+messageNo);
		
		integrationService.deleteMessage(messageNo);
		
	}
}












