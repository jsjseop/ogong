package com.ogong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.common.Search;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@SpringBootTest
public class AdminTest {
	
	@Autowired
	private AdminService adminService;
	
	
	/*
	@Test
	@DisplayName("회원 정지")
	void updateSuspendUser() throws Exception{
		
		User user = new User();
		user.setEmail("user02");
		Report report = new Report();
		report.setSuspendType("3");
		report.setReportUser(user);
		
		System.out.println(user);
		System.out.println(report);
		adminService.updateUserSuspend(report);
	
	*/
	
	//@Test
	//@DisplayName("회원 복구")
	void updateRestoreUser() throws Exception{
		
		User user = new User();
		user.setEmail("user02");
		Report report = new Report();
		report.setReportUser(user);
		
		adminService.updateUserRestore(report);
	}
	
	@Test
	@DisplayName("신고된 사용자 목록 조회")
	void testListReportUser() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
//		search.setSearchCondition("1");
//		search.setSearchKeyword("");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("reportType", "3");
		
		Map<String,Object> result = adminService.getlistReport(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Integer totalCount = (Integer)map.get("totalCount");
		
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		
		System.out.println("================================");
		
	}
	
	//@Test
	@DisplayName("사용자 전체 목록 조회")
	void testgetListTotalUser() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
//		search.setSearchCondition("1");
//		search.setSearchKeyword("");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		//map.put("listType", "1");
		
		Map<String,Object> result = adminService.getlistTotalUser(map);
		List<Object> list = (List<Object>)map.get("list");
		
		Integer totalCount = (Integer)map.get("totalCount");
		
		System.out.println("map : " +map); 
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		//ㅁㄴㅇㅁㄴㅇㅁㄴㅇ
		System.out.println("================================");
		
	}	
}






















