package com.ogong.service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.admin.AdminMapper;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public Map<String, Object> getlistReport(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		List<Report> list= adminMapper.getlistReport(map);
		int totalCount = adminMapper.getReportTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
	}

	@Override
	public Map<String, Object> getlistTotalUser(HashMap<String, Object> map) throws Exception {
		List<User> list= adminMapper.getlistTotalUser(map);
		System.out.println("map"+map);
		int totalCount = adminMapper.getUserTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
	}
	
	@Override
	public void updateUserSuspend(Report report) throws Exception {
		adminMapper.updateUserSuspend(report);
		
	}

	@Override
	public void updateUserRestore(Report report) throws Exception {
		adminMapper.updateUserRestore(report);
		
	}



}
