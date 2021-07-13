package com.ogong.service.studyroom;

import java.util.List;
import java.util.Map;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;

public interface StudyroomService {
	
	public void addGSMember(GroupStudyMember gsm) throws Exception;
	
	public Map<String, Object> getParticipationList(int studyNo) throws Exception;
	
	public void applyParticipation(String email) throws Exception;
	
	public void rejectParticipation(int gmsNo) throws Exception;
	
	public List<GroupStudyMember> getGSMemberList (int studyNo) throws Exception;
	
	public void updateStudy(Study study) throws Exception;
}
