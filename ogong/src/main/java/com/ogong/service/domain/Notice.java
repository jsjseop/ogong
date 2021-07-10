package com.ogong.service.domain;

import lombok.Data;

@Data
public class Notice {

	private int noticeNo;
	private Study noticeStudy;
	private Board noticeBoard;
	private Answer noticeAnswer;
	private GroupStudyMember noticeGroupMember;
	private User noticeUser;
	private User sender;
	private String noticeCategory;
	
}
