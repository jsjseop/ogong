package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Attendance {

	private int attendanceNo;		
	private Study attendanceStudy;		 
	private User attendanceUsers;	
	private Date attendanceEate;	
	
}
