package com.ogong.service.studyroom.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;
import com.ogong.service.studyroom.StudyroomMapper;
import com.ogong.service.studyroom.StudyroomService;

@Service
public class StudyroomServiceImpl implements StudyroomService {

		@Autowired
		StudyroomMapper studyroomMapper;

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

		@Override
		public void addAttendance(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.addAttendance(map);
		}

		@Override
		public void addCalendar(Calendar calendar) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.addCalendar(calendar);
		}

		@Override
		public Calendar getCalendar(int calendarNo) throws Exception {
			// TODO Auto-generated method stub
			return studyroomMapper.getCalendar(calendarNo);
		}

		@Override
		public List<Calendar> getCalendarList(int studyNo) throws Exception {
			// TODO Auto-generated method stub
			return studyroomMapper.getCalendarList(studyNo);
		}

		@Override
		public void updateCalendar(Calendar calendar) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.updateCalendar(calendar);
		}

		@Override
		public void deleteCalendar(int calendarNo) throws Exception {
			// TODO Auto-generated method stub
			studyroomMapper.deleteCalendar(calendarNo);
		}

		@Override
		public String checkAttendance(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return studyroomMapper.checkAttendance(map);
		}
		
		
}
