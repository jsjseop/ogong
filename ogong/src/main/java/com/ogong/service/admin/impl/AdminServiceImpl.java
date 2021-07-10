package com.ogong.service.admin.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ogong.common.Search;
import com.ogong.service.admin.AdminMapper;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;

//@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	@Override
	public Map<String, Object> listReportUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listReportBoard(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listReportComment(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listReportAnswer(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listTotalUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listWithdrawUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listRestoreUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSuspendUser(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
