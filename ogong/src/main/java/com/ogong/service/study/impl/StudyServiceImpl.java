package com.ogong.service.study.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;
import com.ogong.service.study.StudyMapper;
import com.ogong.service.study.StudyService;

@Service
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	StudyMapper studyDao;
	
	@Override
	public void addStudy(Study study) throws Exception {
		
		studyDao.addStudy(study);

	}

	@Override
	public Study getStudy(int studyNo) throws Exception {
		
		return studyDao.getStudy(studyNo); 
		
	}

	@Override
	public Map<String, Object> getStudyList(HashMap<String, Object> map) throws Exception {
		
		List<Study> list= studyDao.getStudyList(map);
		int totalCount = studyDao.getTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}

	@Override
	public void deleteStudy(int studyNo) throws Exception {
		studyDao.deleteStudy(studyNo);
		
	}

}
