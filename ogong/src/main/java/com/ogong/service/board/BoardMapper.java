package com.ogong.service.board;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Board;


	@Repository
	@Mapper
	public interface BoardMapper {
		
		void addBoard(Board board);
		
		Board getBoard(Board board);
		
		int updateBoard(Board board);
		
		int deleteBoard(Board board);
		
		//List<Board> listQaBoard (Map<String, Object> map);
		
		List<Board> listBoard (Board board);
		
		void addComment (Board board);
		
	}