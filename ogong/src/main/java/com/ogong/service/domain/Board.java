package com.ogong.service.domain;

import java.sql.Date;

import com.ogong.common.Search;

import lombok.Data;

@Data
public class Board extends Search{
	
	private int boardNo; // 게시글 번호
	private Study study; //스터디 번호
	private User writer; // 작성자 이메일
	private int boardCategory; // 게시판 카테고리
	private String boardTitle; // 게시글 제목
	private String boardContents; // 게시글 내용
	private String boardInterest; // 게시글 관심사
	private Date boardRegDate; //게시글 등록날짜
	private int viewCount; // 조회수
	private int commentCount; // 댓글수
	private int boardRegBanana; // 게시글 바나나 수
	private int fileFlag; // 파일유무
	private int answerCount; // 답변수
	
}	
	