package com.ogong.service.admin;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;


@Repository
@Mapper
public interface AdminMapper {
	
	//신고된 사용자 목록
	Report listReportUser(Search search);
	
	//신고된 게시글 목록
	Report listReportBoard(Search search);
	
	//신고된 댓글 목록
	Report listReportComment(Search search);
	
	//신고된 답변 목록
	Report listReportAnswer(Search search);
	
	//모든 회원 목록
	User listTotalUser(Search search);
	
	//탈퇴 회원 목록
	User listWithdrawUser(Search search);
	
	//복구 회원 목록
	User listRestoreUser(Search search);
	
	//정지 회원 목록
	User listSuspendUser(Search search);
	
	//회원 정지
	Report updateUserSuspend(Report report);
	
	//회원 복구
	Report updateUserRestore(Report report);
	
	
	
}
