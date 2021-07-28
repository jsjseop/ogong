package com.ogong.service.study;

import java.util.Map;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;

public interface TestStudyService {

	public void addStudy(Study study) throws Exception;
	
	public Study getStudy(int studyNo) throws Exception;
	
	public void entranceStudy(int studyNo) throws Exception;
	
	public void leaveStudy(int studyNo) throws Exception;
	
	public Map<String, Object> getStudyList(Search search) throws Exception;

}
	/*
	 * public void addStudy(Study study) throws Exception;
	 * 
	 * public Study getStudy(int studyNo) throws Exception;
	 * 
	 * public void entranceStudy(int studyNo) throws Exception;
	 * 
	 * public void leaveStudy(int studyNo) throws Exception;
	 * 
	 * public Map<String, Object> getStudyList(Search search) throws Exception;
	 * 
	 * Map<String, Object> getStudyList(Map<String, Object> map) throws Exception;
	 */


