package com.ogong.service.banana.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.banana.BananaMapper;
import com.ogong.service.banana.BananaService;
import com.ogong.service.domain.Banana;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@Service
public class BananaServiceImpl implements BananaService{
	
	@Autowired
	BananaMapper bananaMapper;

	
	@Override
	public void addBanana(Banana banana) throws Exception {

		bananaMapper.addBanana(banana);
		
	}

	@Override
	public Map<String, Object> getlistAcquireBanana(HashMap<String, Object> map) throws Exception {

		List<Banana> list= bananaMapper.getlistAcquireBanana(map);
		int totalCount = bananaMapper.getAcquireCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
		
	}

	@Override
	public Map<String, Object> getlistUseBanana(HashMap<String, Object> map) throws Exception {

		List<Banana> list= bananaMapper.getlistUseBanana(map);
		int totalCount = bananaMapper.getUseCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return result;
		
	}

	@Override
	public void updateUseBanana(User user) throws Exception {

		bananaMapper.updateUseBanana(user);
		
	}
	
	@Override
	public void updateAcquireBanana(User user) throws Exception {

		bananaMapper.updateAcquireBanana(user);
		
	}	
	
	
	
}
