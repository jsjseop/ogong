package com.ogong.service.studyroom.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.studyroom.StudyroomMapper;
import com.ogong.service.studyroom.StudyroomService;

public class StudyroomServiceImpl implements StudyroomService {

		@Autowired
		StudyroomMapper studyDAO;

		@Override
		public void addGroupStudyMember(GroupStudyMember gs) throws Exception {
			// TODO Auto-generated method stub
			
		}
		
		
}
