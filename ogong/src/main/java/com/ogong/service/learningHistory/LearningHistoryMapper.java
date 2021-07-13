package com.ogong.service.learningHistory;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.LearningHistory;

@Repository
@Mapper
public interface LearningHistoryMapper {
	
	List<LearningHistory> getLearningHistoryList(HashMap<String, Object> map);
	
	String getTodayLearningTime(String email);
	
	String getAverageLearningTime(String email);
	
	String getTotalLearningTime(String email);
}
