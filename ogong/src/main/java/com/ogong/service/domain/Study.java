package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Study {
	
	private int studyNo; 				
	private User studyMaker;			
	private String studyName;			
	private String studyHashtag;		
	private String studyThumbnail;	
	private Date studyStartDate;		
	private Date studyEndDate;		
	private Date studyRegDate;		
	private int currentMember;			
	private int maxMember;				
	private String selfStudyRule;		
	private String selfStudyOpenFlag;	
	private String selfStudyPassword;	
	private String groupStudyInfo;		
	private String groupStudyPlan;		
	private String groupStudyCondition;	
	private Date recruitmentStartDate;
	private Date recruitmentEndDate;	
	private String studyEndFlag;		
	private String studyRoomGrade;		
	private String studyType;			
	private String studyInterest;		

}
