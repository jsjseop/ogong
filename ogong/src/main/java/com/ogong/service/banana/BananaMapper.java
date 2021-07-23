package com.ogong.service.banana;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Banana;
import com.ogong.service.domain.User;

@Repository
@Mapper
public interface BananaMapper {

	//바나나 인서트
	public int addBanana(Banana banana);
	
	//획득한 바나나 목록
	List<Banana> getlistAcquireBanana(HashMap<String, Object> map);
	
	//사용한한 바나나 목록
	List<Banana> getlistUseBanana(HashMap<String, Object> map);
	
	//바나나 +획득
	void updateAcquireBanana(User user);
	
	//바나나 -차감
	void updateUseBanana(User user);
	
	
	
	int getAcquireCount(HashMap<String, Object> map);
	
	int getUseCount(HashMap<String, Object> map);
}
