package com.ogong;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.common.Search;
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
		
		
		String[] day = {"2021-06-01","2021-06-31","2021-05-25","2021-05-30"};
		
		Date d[] = new Date[4];
		
		for (int i =0; i<d.length; i++) {
			d[i] = Date.valueOf(day[i]);
		}
		
		User user = new User();
		user.setEmail("user04");
		study.setStudyMaker(user);
		study.setStudyName("자기계발");
		study.setStudyHashtag("#자기계발");
		study.setStudyThumbnail("a.jpg");
		study.setStudyStartDate(d[0]);
		study.setStudyEndDate(d[1]);
		study.setMaxMamber(5);
		study.setRecruitmentStartDate(d[2]);
		study.setRecruitmentEndDate(d[3]);
		study.setStudyRoomGrade("basic");
		study.setStudyType("group");
		study.setStudyInterest("자기계발");
		
		studyService.addStudy(study);
		
		
		
	}
	
//	@Test
//	@DisplayName("그룹 스터디 정보 조회")
	void testGetStudy() throws Exception {
		
		Study study = studyService.getStudy(10002);
		
		System.out.println("getStudy 결과 :: "+study);
		
		
		
	}
	
	@Test
	@DisplayName("그룹스터디 목록 조회")
	void testlistStudy() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("");
		
		
		Map<String,Object> map = studyService.getStudyList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		
		Integer totalCount = (Integer)map.get("totalCount");
		
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		
		System.out.println("================================");
		
	}
	
	//@Test
	//@DisplayName("그룹 스터디 정보 조회")
	void testDeleteStudy() throws Exception {
			
		studyService.deleteStudy(10002);
			
	}

}
