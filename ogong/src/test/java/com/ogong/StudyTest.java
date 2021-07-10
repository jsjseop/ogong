package com.ogong;

import java.sql.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;

@SpringBootTest
class StudyTest {

	@Autowired
	private StudyService studyService;
	
	//@Test
	//@DisplayName("그룹 스터디 생성")
	void testAddStudy() throws Exception {
		
		Study study = new Study();
		User user = new User();
		
		String[] day = {"2021-06-07","2021-06-31","2021-06-01","2021-06-03"};
		
		Date d[] = new Date[4];
		
		for (int i =0; i<d.length; i++) {
			d[i] = Date.valueOf(day[i]);
		}
		
		user.setEmail("user02");
		
		study.setStudyMaker(user);
		study.setStudyName("junit테스트용");
		study.setStudyHashtag("#java");
		study.setStudyThumbnail("j.jpg");
		study.setStudyStartDate(d[0]);
		study.setStudyEndDate(d[1]);
		study.setMaxMamber(5);
		study.setRecruitmentStartDate(d[2]);
		study.setRecruitmentEndDate(d[3]);
		study.setStudyRoomGrade("basic");
		study.setStudyType("group");
		study.setStudyInterest("취업");
		
		studyService.addStudy(study);
		
		
		
	}
	
	@Test
	@DisplayName("그룹 스터디 정보 조회")
	void testGetStudy() throws Exception {
		
		Study study = studyService.getStudy(10000);
		
		System.out.println("getStudy 결과 :: "+study);
		
		
		
	}

}
