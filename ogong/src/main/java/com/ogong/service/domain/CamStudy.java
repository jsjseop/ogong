package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CamStudy {

	private int camStudyMemberNo;
	private User user;
	private Study study;
	private String studyRole;
	private String nickname;
	private Date learningTime;
	private String learningType;
	private Date entranceTime;
	private Date totalLearningTime;

}
