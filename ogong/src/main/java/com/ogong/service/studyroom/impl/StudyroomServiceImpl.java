package com.ogong.service.studyroom.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.studyroom.StudyroomMapper;
import com.ogong.service.studyroom.StudyroomService;

@Service
public class StudyroomServiceImpl implements StudyroomService {

		@Autowired
		StudyroomMapper studyroomMapper;

		@Override
		public void addGSMember(GroupStudyMember gsm) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.addGSMember(gsm);
		}

		@Override
		public Map<String, Object> getParticipationList(int studyNo) throws Exception {
			// TODO Auto-generated method stub
			
			List<GroupStudyMember> list = studyroomMapper.getParticipationList(studyNo);
			int totalCount = studyroomMapper.getTotalCount(studyNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("totalCount", new Integer(totalCount));
			
			return map;
		}

		@Override
		public void applyParticipation(String email) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.applyParticipation(email);
		}

		@Override
		public void rejectParticipation(int gmsNo) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.rejectParticipation(gmsNo);
		}

		@Override
		public List<GroupStudyMember> getGSMemberList(int studyNo) throws Exception {
			// TODO Auto-generated method stub
			return studyroomMapper.getGSMemberList(studyNo);
		}

		public void updateStudy(Study study) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.updateStudy(study);
		}
		
		
}
