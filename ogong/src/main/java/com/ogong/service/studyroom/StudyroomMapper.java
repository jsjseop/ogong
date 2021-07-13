package com.ogong.service.studyroom;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface StudyroomMapper {
	
	void addGSMember(GroupStudyMember gsm);
	
	List<GroupStudyMember> getParticipationList(int studyNo);
	
	int getTotalCount(int studyNo);
	
	void applyParticipation(String email);
	
	void rejectParticipation(int gsmNo);
	
	List<GroupStudyMember> getGSMemberList(int studyNo);
	
	void updateStudy(Study study);
}