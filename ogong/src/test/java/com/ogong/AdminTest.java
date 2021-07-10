package com.ogong;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@SpringBootTest
public class AdminTest {
	
	@Autowired
	private AdminService adminService;
	
	@Test
	@DisplayName("회원 정지")
	void updateSuspendUser() throws Exception{
		
		User user = new User();
		user.setEmail("user01");
		Report report = new Report();
		report.setSuspendType("3");
		user.setSuspendStartDate(null);
		user.setSuspendEndDate(null);
		user.setCondition("3");
		
		System.out.println(user);
		System.out.println(report);
		adminService.updateUserSuspend(report);
		
		
		
		
		
	}
}
