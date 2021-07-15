package com.ogong.service.board;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;


	@Repository
	@Mapper
	public interface BoardMapper {
		
		//게시글 등록
		void addBoard(Board board);
		
		//게시글 조회
		Board getBoard(Board board);
		
		//게시글 수정
		void updateBoard(Board board);
		
		//게시글 삭제
		void deleteBoard(int boardNo);
		
		//게시글 목록
		List<Board> listBoard(Map<String, Object> map) ;
		
		//댓글 등록
		void addComment (Comment comment);
		
		//댓글 수정
		void updateComment (Comment comment);
		
		//댓글 삭제
		void deleteComment (int commentNo);
		
		//댓글 목록
		List<Comment> listComment(int boardNo) ;
		
		int getTotalCount(Search search);
		
		//Q&A 답변 등록
		void addAnswer(Answer answer);
		
		//Q&A 답변 수정
		void updateAnswer (Answer answer);
		
		//Q&A 답변 삭제
		void deleteAnswer (int answerNo);
	}