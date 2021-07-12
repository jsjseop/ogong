package com.ogong.service.study;

import java.util.HashMap;
import java.util.Map;

import com.ogong.service.domain.Study;

public interface TestStudyService {

	public void addStudy(Study study) throws Exception;
	
	public Study getStudy(int studyNo) throws Exception;
	
	public Map<String, Object> getStudyList(HashMap<String, Object> map) throws Exception;
	
}
