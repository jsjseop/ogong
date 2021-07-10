package com.ogong.service.study;

import org.springframework.stereotype.Service;

import com.ogong.service.domain.Study;

@Service
public interface StudyService {
	

	public void addStudy(Study study) throws Exception;
	
	public Study getStudy(int studyNo) throws Exception;

}
