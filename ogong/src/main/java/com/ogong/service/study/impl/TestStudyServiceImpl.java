package com.ogong.service.study.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogong.service.domain.Study;
import com.ogong.service.study.TestStudyMapper;
import com.ogong.service.study.TestStudyService;

@Service
public class TestStudyServiceImpl implements TestStudyService {

	@Autowired
	TestStudyMapper studyMapper;
	
	@Override
	@Transactional
	public void addStudy(Study study) throws Exception {
		
		studyMapper.addStudy(study);
		
	}

	@Override
	public Study getStudy(int studyNo) throws Exception {
		
		return studyMapper.getStudy(studyNo);
		
	}

	@Override
	public Map<String, Object> getStudyList(Map<String, Object> map) throws Exception {
		
		List<Study> list= studyMapper.getStudyList(map);
		int totalCount = studyMapper.getTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}
	
}