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
	public void addUser(User user) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		userDAO.addUser(user);
	}
	
	
	  @Override public User getUser(User user) throws Exception {
	  
	  return userDAO.getUser(user); }
	 
	




	@Override
	public User getProfile(String email) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return null;
	}

	@Override
	public void updateProfile(User user) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		
	}

	@Override
	public void updatePassword(User user) throws Exception {
		userDAO.updatePassword(user);
		
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String email) throws Exception {
		
		return userDAO.idCheck(email);
	}

	@Override
	public User getPassword() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public User getUser(String email) throws Exception { // TODO
	 * Auto-generated method stub return userDAO.getUser(email); }
	 */
	
	
}