package com.ogong.service.integration.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationMapper;
import com.ogong.service.integration.IntegrationService;

@Service
public class IntegrationServiceImpl implements IntegrationService {
	
	@Autowired
	IntegrationMapper integrationMapper;

	@Override
	public Map<String, Object> getlistReceiveMessage(HashMap<String, Object> map) throws Exception {
		
		List<Message> list = integrationMapper.getlistReceiveMessage(map);
		int totalCount = integrationMapper.getTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
	}

	@Override
	public Map<String, Object> getlistSendMessage(HashMap<String, Object> map) throws Exception {
		List<Message> list = integrationMapper.getlistSendMessage(map);
		int totalCount = integrationMapper.getTotalCount2(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
	}

	@Override
	public void addSendMessage(Message message) throws Exception {

		integrationMapper.addSendMessage(message);
	}

	@Override
	public void deleteMessage(int[] messageNo) throws Exception {

		integrationMapper.deleteMessage(messageNo);
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		integrationMapper.addNotice(notice);
	}

	@Override
	public Map<String, Object> listLearningHistoryRanking() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public Map<String, Object> listBananaRanking(HashMap<String, Object> map) throws Exception {
		
		List<User> list = integrationMapper.listBananaRanking(map);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		
		
		return result;
	}

	@Override
	public Map<String, Object> listChooseCountRanking(HashMap<String, Object> map) throws Exception {
		List<User> list = integrationMapper.listChooseCountRanking(map);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		
		
		return result;
	}

	@Override
	public Notice getlistNotice(String email) throws Exception {

		return integrationMapper.getlistNotice(email);
	}
	
	@Override
	public Notice getNotice(int noticeNo) throws Exception{
		
		return integrationMapper.getNotice(noticeNo);
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {

		integrationMapper.deleteNotice(noticeNo);
	}

	@Override
	public void deleteAllNotice(String email) throws Exception {

		integrationMapper.deleteAllNotice(email);
	}
	
	@Override
	public int getNoticeCount(String email) {
		
		return integrationMapper.getNoticeCount(email);
	}
	
	@Override
	public void updateNotice(String email) throws Exception{
		
		integrationMapper.updateNotice(email);
	}
	

}
