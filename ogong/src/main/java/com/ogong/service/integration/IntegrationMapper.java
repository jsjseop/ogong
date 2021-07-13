package com.ogong.service.integration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;

@Repository
@Mapper
public interface IntegrationMapper {

	//받은 쪽지 조회
	List<Message> getlistReceiveMessage(HashMap<String, Object> map);
	
	//보낸 쪽지 조회
	List<Message> getlistSendMessage(HashMap<String, Object> map);
	
	//쪽지 보내기
	public int addSendMessage(Message message);
	
	//쪽지 삭제
	public void deleteMessage(int[] messageNo);
	
	//알림
	public void addNotice(Notice notice);
	
	//공부시간 랭킹
	List<User> listLearningHistoryRanking();
	
	//바나나 랭킹
	List<User> listBananaRanking(HashMap<String, Object> map);
	
	//채택수 랭킹
	List<User> listChooseCountRanking(HashMap<String, Object> map);
	
	//알림 목록
	Notice getlistNotice(String email);
	
	//알림 삭제
	void deleteNotice(int noticeNo);
	
	//알림 전체 삭제
	void deleteAllNotice(String email);
	
	//페이지 수
	int getTotalCount(HashMap<String, Object> map);
	int getTotalCount2(HashMap<String, Object> map);
	
	
	
	
	
}
