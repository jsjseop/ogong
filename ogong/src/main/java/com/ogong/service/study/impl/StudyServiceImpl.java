package com.ogong.service.study.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.domain.Study;
import com.ogong.service.study.StudyMapper;
import com.ogong.service.study.StudyService;

@Service
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	StudyMapper studyDAO;
	
	@Override
	public void addStudy(Study study) throws Exception {
		
		studyDAO.addStudy(study);
		
	}

	@Override
	public Study getStudy(int studyNo) throws Exception {
		
		return studyDAO.getStudy(studyNo); 
				
		
	}

}
