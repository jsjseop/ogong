package com.ogong.service.study;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface TestStudyMapper {

	void addStudy(Study study);
	
	Study getStudy(int studyNo);
	
	List<Study> getStudyList(Search search);
	
	int getTotalCount(Search search);
	
	void updateMember(@Param("studyNo") int StudyNo,@Param("num") int num);
	
}
