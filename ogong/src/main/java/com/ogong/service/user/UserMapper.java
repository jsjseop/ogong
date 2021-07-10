package com.ogong.service.user;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.User;

@Repository
@Mapper
public interface UserMapper {
	
	User getUser(String userId);
}
