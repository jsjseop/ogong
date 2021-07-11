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
	StudyMapper studyDAO;
	
	@Override
	public void addStudy(Study study) throws Exception {	
		studyDAO.addStudy(study);

	}

	@Override
	public Study getStudy(int studyNo) throws Exception {
		return studyDAO.getStudy(studyNo); 
		
	}

	@Override
	public Map<String, Object> getStudyList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Study> list= studyDAO.getStudyList(search);
		int totalCount = studyDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void deleteStudy(int studyNo) throws Exception {
		studyDAO.deleteStudy(studyNo);
		
	}

}
