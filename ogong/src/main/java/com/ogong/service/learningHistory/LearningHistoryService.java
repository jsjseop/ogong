package com.ogong.service.learningHistory;

import java.util.HashMap;
import java.util.List;

import com.ogong.service.domain.LearningHistory;

public interface LearningHistoryService {
	
	public List<LearningHistory> getLearningHistoryList(HashMap<String, Object> map) throws Exception;
	
	public String getTodayLearningTime(String email) throws Exception;
	
	public String getAverageLearningTime(String email) throws Exception;
	
	public String getTotalLearningTime(String email) throws Exception;
}
