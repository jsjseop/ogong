package com.ogong.web.study;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.common.Search;
import com.ogong.service.study.StudyService;

@RestController
@RequestMapping("/study/*")
public class RestStudyController {

	@Autowired
	private StudyService studyService;
	
	public RestStudyController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@PostMapping("/json/listStudy")
	public Map<String, Object> listStudy( @RequestBody Search search)throws Exception{
			
//		if(search.getCurrentPage() ==0 ){
//			search.setCurrentPage(1);
//		}
//		
		search.setPageSize(6);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("studyType", "group");
		
		Map<String, Object> result = studyService.getStudyList(map);
		
		return result;
	}

}
