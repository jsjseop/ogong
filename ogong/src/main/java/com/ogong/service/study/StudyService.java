package com.ogong.service.study;


import com.ogong.service.domain.Study;


public interface StudyService {
	

	public void addStudy(Study study) throws Exception;
	
	public Study getStudy(int studyNo) throws Exception;

}
