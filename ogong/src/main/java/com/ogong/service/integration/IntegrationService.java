package com.ogong.service.integration;

import java.util.HashMap;
import java.util.Map;

import com.ogong.common.Search;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;

public interface IntegrationService {

	//받은 쪽지 조회
	public Map<String, Object> getlistReceiveMessage(HashMap<String, Object> map) throws Exception;
	
	//보낸 쪽지 조회
	public Map<String, Object> getlistSendMessage(HashMap<String, Object> map) throws Exception;
	
	//쪽지 보내기
	public void addSendMessage(Message message) throws Exception;
	
	//쪽지 삭제
	public void deleteMessage(int[] messageNo) throws Exception;
	
	//알림
	public void addNotice(Notice notice) throws Exception;
	
	//공부시간 랭킹
	public Map<String, Object> listLearningHistoryRanking() throws Exception;
	
	//바나나 랭킹
	public Map<String, Object> listBananaRanking(HashMap<String, Object> map) throws Exception;
	
	//채택수 랭킹
	public Map<String, Object> listChooseCountRanking(HashMap<String, Object> map) throws Exception;
	
	//알림 조회
	public Notice getNotice(int noticeNo) throws Exception;
	
	//알림 목록 조회
	public Notice getlistNotice(String email) throws Exception;
	
	//알림 선택 삭제
	public void deleteNotice(int noticeNo) throws Exception;
	
	//알림 전체 삭제
	public void deleteAllNotice(String email) throws Exception;
	
	//알림 읽음 표시
	public void updateNotice(String email) throws Exception;
	
	//알림 카운트
	int getNoticeCount (String email) throws Exception;
	
	
	
	
	
	
}
