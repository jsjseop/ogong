package com.ogong.service.admin;

import java.util.Map;

import com.ogong.common.Search;
import com.ogong.service.domain.Message;

public interface AdminService {

	// 등록
	public int addMessage(Message message) throws Exception;
	
	// 리스트
	public Map<String, Object> getMessageList(Search search) throws Exception;
	
}
