package com.ogong.service.study;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface TestStudyMapper {

	void addStudy(Study study);
	
	Study getStudy(int studyNo);
	
	List<Study> getStudyList(Map<String, Object> map);
	
	int getTotalCount(Map<String, Object> map);
	
	void updateMember(@Param("studyNo") int StudyNo,@Param("num") int num);
	
}
