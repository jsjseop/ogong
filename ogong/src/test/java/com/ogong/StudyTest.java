package com.ogong;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.common.Search;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;
import com.ogong.service.studyroom.StudyroomService;

@SpringBootTest
class StudyTest {

	@Autowired
	private StudyService studyService;
	
	@Autowired
	private StudyroomService studyroomService;
	
	//@Test
	//@DisplayName("그룹 스터디 생성")
	void testAddStudy() throws Exception {
		
		Study study = new Study();
		
		
		String[] day = {"2021-06-01","2021-06-31","2021-05-25","2021-05-30"};
		
		Date d[] = new Date[4];
		
		for (int i =0; i<d.length; i++) {
			d[i] = Date.valueOf(day[i]);
		}
		
		User user = new User();
		user.setEmail("user04");
		study.setStudyMaker(user);
		study.setStudyName("hot스터디");
		study.setStudyHashtag("#hot");
		study.setStudyThumbnail("hot.jpg");
		study.setStudyStartDate(d[0]);
		study.setStudyEndDate(d[1]);
		study.setMaxMamber(5);
		study.setRecruitmentStartDate(d[2]);
		study.setRecruitmentEndDate(d[3]);
		study.setStudyRoomGrade("basic");
		study.setStudyType("group");
		study.setStudyInterest("자기계발");
		
		studyService.addStudy(study);
		
		System.out.println(" 넘어온 시퀀스 studyNo 값 확인 : "+study.getStudyNo());
		
		GroupStudyMember gsm = new GroupStudyMember();
		gsm.setStudy(study);
		gsm.setMember(user);
		gsm.setStudyRole("3");
		gsm.setDiligenceScore(new Double(0));
		gsm.setParticipationScore(new Double(0));
		gsm.setApprovalFlag("1");
		
		studyroomService.addGSMember(gsm);
		
		
	}
	
	//@Test
	//@DisplayName("그룹 스터디 정보 조회")
	void testGetStudy() throws Exception {
		
		Study study = studyService.getStudy(10002);
		
		System.out.println("getStudy 결과 :: "+study);
		
		
		
	}
	
	@Test
	@DisplayName("그룹스터디 목록 조회")
	void testgetStudyList() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("");
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("studyType", "group");
		
		Map<String,Object> result = studyService.getStudyList(map);
		
		List<Object> list = (List<Object>)result.get("list");
		Integer totalCount = (Integer)result.get("totalCount");
		
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		
		System.out.println("================================");
		
	}
	
	//@Test
	//@DisplayName("그룹스터디 삭제")
	void testDeleteStudy() throws Exception {
			
		studyService.deleteStudy(10002);
			
	}

}
