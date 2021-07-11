package com.ogong;

import java.sql.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.StudyService;

@SpringBootTest
public class SelfStudyTest {

	@Autowired
	private StudyService studyService;
	
	@Test
	@DisplayName("자율 스터디 생성")
	void testAddStudy() throws Exception {
		
		Study study = new Study();
		User user = new User();
		
		String[] day = {"2021-06-07","2021-06-31","2021-06-01","2021-06-03"};
		
		Date d[] = new Date[4];
		
		for (int i =0; i<d.length; i++) {
			d[i] = Date.valueOf(day[i]);
		}
		
		user.setEmail("user01");
		
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
}
