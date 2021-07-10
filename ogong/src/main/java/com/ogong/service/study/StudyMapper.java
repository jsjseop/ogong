package com.ogong.service.study;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface StudyMapper {
	
	void addStudy(Study study);
	
	Study getStudy(int studyNo);

}
