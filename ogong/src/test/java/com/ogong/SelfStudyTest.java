package com.ogong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.common.Search;
import com.ogong.service.domain.Study;
import com.ogong.service.domain.User;
import com.ogong.service.study.TestStudyService;

@SpringBootTest
public class SelfStudyTest {

	@Autowired
	private TestStudyService studyService;
	
	@Test
	@DisplayName("자율 스터디 생성")
	void testAddStudy() throws Exception {
		
		Study study = new Study();
		User user = new User();
		
		String[] day = {"2021-08-01","2021-08-07"};
		
		user.setEmail("user06");
		
		study.setStudyMaker(user);
		study.setStudyName("자율스터디3");
		study.setStudyHashtag("#test3");
		study.setStudyThumbnail("j3.jpg");
		study.setStudyStartDate(day[0]);
		study.setStudyEndDate(day[1]);
		study.setMaxMember(8);
		study.setSelfStudyRule("자율스터디3 규칙입니다.");
		study.setSelfStudyOpenFlag("1");
		study.setStudyRoomGrade("basic");
		study.setStudyType("self");
		study.setStudyInterest("기타공부");
		
		studyService.addStudy(study);
		
	}
	
	//@Test
	@DisplayName("자율스터디 정보조회")
	void testGetStudy() throws Exception{
		
		Study study = studyService.getStudy(10008);
		
		System.out.println(study);
	}
	
	//@Test
	@DisplayName("자율스터디 목록조회")
	void testlistStudy() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		search.setSearchKeyword("방");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("studyType", "self");
		
		Map<String,Object> result = studyService.getStudyList(map);
		
		List<Object> list = (List<Object>)result.get("list");
		
		Integer totalCount = (Integer)result.get("totalCount");
		
		System.out.println("list 값 : "+list);
		System.out.println("list size : "+list.size());
		System.out.println("total Count : "+totalCount);
		
		System.out.println("================================");
		
	}
	
}
