package com.ogong;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;

@SpringBootTest
class StudyroomTest {

	@Autowired
	private StudyroomService studyroomService;
	
	@Autowired
	private StudyService studyService;
	
	
	//@Test
	//@DisplayName("스터디 참가신청 목록")
	void testGetParticipationList() throws Exception {
		
		
		Map<String,Object> result = studyroomService.getParticipationList(10000);
		
		List<Object> list = (List<Object>)result.get("list");
		Integer totalCount = (Integer)result.get("totalCount");
		
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		
		System.out.println("================================");
		
	}
	
	
	//@Test
	//@DisplayName("스터디 참가신청 ")
	void testAddGSMember() throws Exception {
		
		GroupStudyMember gsm = new GroupStudyMember();
		Study study = new Study();
		User user = new User();
		study.setStudyNo(10000);
		user.setEmail("user03");
		gsm.setStudy(study);
		gsm.setMember(user);
		gsm.setStudyRole("4");
		gsm.setDiligenceScore(new Double(0));
		gsm.setParticipationScore(new Double(0));
		gsm.setApprovalFlag("0");
		
		studyroomService.addGSMember(gsm);
		
	}
	
	//@Test
	//@DisplayName("스터디 참가신청 승인")
	void testApplyParticipation() throws Exception {
		
		studyroomService.applyParticipation("user03");
			
	}
	
	//@Test
	//@DisplayName("스터디 참가신청 거절")
	void testRejectParticipation() throws Exception {
		
		studyroomService.rejectParticipation(1);
			
	}
	
	//@Test
	//@DisplayName("그룹스터디 회원목록")
	void testGetGSMemberList() throws Exception {
		
		List<GroupStudyMember> list = studyroomService.getGSMemberList(10000);
		
		System.out.println("===================================");
		
		System.out.println("list 값 : "+list);
		System.out.println("list 사이즈 : "+list.size());
		
		System.out.println("===================================");
			
	}
	
	
	
	@Test
	@DisplayName("스터디룸 정보수정")
	void testUpdateGSMember() throws Exception {
		
		Study study = studyService.getStudy(10002);
		
		study.setStudyName("수정스터디");
		study.setStudyHashtag("#수정");
		study.setStudyThumbnail("update.jpg");
		study.setGroupStudyInfo("수정");
		study.setGroupStudyPlan("수정");
		study.setGroupStudyCondition("수정");
		
		studyroomService.updateStudy(study);
		
		System.out.println("updateStudy 결과 :: "+study);
		
		
		
	}
	
	
	
	
	

}
