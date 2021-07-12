package com.ogong.service.study;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface TestStudyMapper {

	void addStudy(Study study);
	
	Study getStudy(int studyNo);
	
	List<Study> getStudyList(HashMap<String, Object> map);
	
	int getTotalCount(HashMap<String, Object> map);
}
