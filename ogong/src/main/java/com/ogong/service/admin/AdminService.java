package com.ogong.service.admin;

import java.util.Map;

import com.ogong.service.domain.User;
import com.ogong.common.Search;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Report;

public interface AdminService {

	// 신고된 사용자 조회
	public Map<String, Object> listReportUser(Search search) throws Exception;
	
	// 신고된 게시글 조회
	public Map<String, Object> listReportBoard(Search search) throws Exception;
	
	// 신고된 댓글 조회
	public Map<String, Object> listReportComment(Search search) throws Exception;
	
	// 신고된 답변 조회
	public Map<String, Object> listReportAnswer(Search search) throws Exception;
	
	// 모든 회원 조회
	public Map<String, Object> listTotalUser(Search search) throws Exception;
	
	// 모든 탈퇴회원 조회
	public Map<String, Object> listWithdrawUser(Search search) throws Exception;
	
	// 모든 복구회원 조회
	public Map<String, Object> listRestoreUser(Search search) throws Exception;
	
	// 모든 정지회원 조회
	public Map<String, Object> listSuspendUser(Search search) throws Exception;
	
	// 회원 정지하기
	public void updateUserSuspend(Report report) throws Exception;
	
	// 회원 복구하기
	public void updateUserRestore(Report report) throws Exception;
	
}
