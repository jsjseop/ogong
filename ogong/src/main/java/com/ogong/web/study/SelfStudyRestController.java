package com.ogong.web.study;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.common.Search;
import com.ogong.service.study.TestStudyService;

@RestController
@RequestMapping("/selfStudy/*")
public class SelfStudyRestController {

	@Autowired
	private TestStudyService studyService;
	
	public SelfStudyRestController() {
		System.out.println(this.getClass());
	}
	
	@PostMapping("/json/listStudy")
	public Map<String, Object> listStudy(@RequestBody Search search) throws Exception {
		
		search.setPageSize(8);
		
		Map<String, Object> result = studyService.getStudyList(search);
		
		return result;
	}
	
}
