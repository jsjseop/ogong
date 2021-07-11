package com.ogong.service.studyroom;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.GroupStudyMember;

@Repository
@Mapper
public interface StudyroomMapper {
	
	void addGroupStudyMember(GroupStudyMember gs);

}
