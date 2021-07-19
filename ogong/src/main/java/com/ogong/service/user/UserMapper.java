package com.ogong.service.user;

import java.awt.datatransfer.Clipboard;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Board;
import com.ogong.service.domain.User;

@Repository
@Mapper
public interface UserMapper {
	
	//회원가입
	void addUser(User user);
	
	//로그인
	User getUser(User user);
//	User getUser (String email);
	
	//프로필보기
	User getProfile(String email);
	
	//프로필수정
	void updateProfile(User user);
	
	//비밀번호 변경
	void updatePassword(User user);
	
	//비밀번호 찾기
	User getPassword(String email);
	
	// 아이디 중복체크
	public int idCheck(String email);

	

}