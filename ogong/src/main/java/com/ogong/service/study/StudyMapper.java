package com.ogong.service.study;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface StudyMapper {
	
	void addStudy(Study study);
	
	Study getStudy(int studyNo);
	
	List<Study> getStudyList(Search search);
	
	int getTotalCount(Search search);

}
