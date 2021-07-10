package com.ogong.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.domain.User;
import com.ogong.service.user.UserMapper;
import com.ogong.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userDAO;

	@Override
	public User getUser(String userId) throws Exception {
		
		return userDAO.getUser(userId);
	} 
	
	
}
