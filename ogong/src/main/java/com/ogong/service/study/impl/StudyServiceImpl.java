package com.ogong.service.study.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.study.StudyMapper;
import com.ogong.service.study.StudyService;

@Service
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	StudyMapper studyMapper;
	
	@Override
	public void addStudy(Study study) throws Exception {
		
		studyMapper.addStudy(study);

	}

	@Override
	public Study getStudy(int studyNo) throws Exception {
		
		return studyMapper.getStudy(studyNo); 
		
	}

	@Override
	public Map<String, Object> getStudyList(HashMap<String, Object> map) throws Exception {
		
		List<Study> list= studyMapper.getStudyList(map);
		int totalCount = studyMapper.getTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}

	@Override
	public void deleteStudy(int studyNo) throws Exception {
		studyMapper.deleteStudy(studyNo);
		
	}
	
	@Override
	public void addParticipation(GroupStudyMember gsm) throws Exception {
		// TODO Auto-generated method stub
		studyMapper.addParticipation(gsm);
	}

}
