package com.ogong.service.user;

import org.springframework.stereotype.Service;

import com.ogong.service.domain.User;

@Service
public interface UserService {

//	회원가입
	
	public void addUser(User user) throws Exception;
	
	
	  //로그인? 
	  public User getUser(User user)throws Exception;
		
	  	  
	   //프로필 보기
	   public   User getProfile(String email)throws Exception;
	  
	  // 프로필 수정 
	   public void updateProfile(User user) throws Exception;
	  
	   
	  //비밀번호 변경 
	   public void updatePassword(User user) throws Exception;
	  
	  //비밀번호 찾기
	   public User getPassword() throws Exception;
	  
	 // 회원탈퇴
	  
	  
	 // 회원복구
	  
	 //  유저 이메일 중복확인 
		public int idCheck(String email) throws Exception;





	   
}