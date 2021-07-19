package com.ogong.web.integration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.common.Search;
import com.ogong.service.domain.Notice;
import com.ogong.service.integration.IntegrationService;

@RestController
@RequestMapping("/integration/*")
public class IntegrationRestController {
	
	@Autowired
	private IntegrationService integrationService;
	
	public IntegrationRestController() {
		System.out.println(this.getClass());
	}
	
	@GetMapping(value="json/getNoticeCount/{email}")
	public int getNoticeCount(@PathVariable("email") String email) throws Exception {
		
		System.out.println("/getNoticeCount : GET");
		
		return integrationService.getNoticeCount(email);
	}
	
	
	
	@GetMapping(value="json/getlistNotice/{email}")
	public List<Notice> getlistNotice(@PathVariable("email") String email) throws Exception{
		
		System.out.println("/getListNotice : GET");
		Search search = new Search();
		search.setStartRowNum(1);
		search.setEndRowNum(5);
		
		return integrationService.getlistNotice(email);
	}
	
	
	
	@GetMapping(value="json/updateNotice/{email}")
	public void updateNotice(@PathVariable("email") String email) throws Exception {
		
		System.out.println("updateNotice : GET");
		integrationService.updateNotice(email);
	}
	
	
	@GetMapping(value="json/deleteNotice/{noticeNo}")
	public void deleteNotice(@PathVariable("noticeNo")int noticeNo) throws Exception {
		
		System.out.println("deleteNotice : GET");

		integrationService.deleteNotice(noticeNo);
	}
	
	@GetMapping(value="json/deleteNoticeAll/{email}")
	public void deleteAllNotice(@PathVariable("email")String email) throws Exception {
		
		System.out.println("deleteAllNotice : GET");
		
		integrationService.deleteAllNotice(email);
	}
	
	@GetMapping(value="json/deleteMessage/{messageNo}")
	public void deleteMessage(@PathVariable("messageNo") int messageNo) throws Exception{
		
		integrationService.deleteMessage(messageNo);
	}
	
	
	
	/* @PostMapping(value="json/deleteMessage/{email}") */
}









