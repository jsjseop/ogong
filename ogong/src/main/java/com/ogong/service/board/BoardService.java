package com.ogong.service.board;

import java.util.List;
import java.util.Map;

import com.ogong.service.domain.Board;

public interface BoardService {

		public void addBoard(Board board) throws Exception;
		
		public Board getBoard(Board board) throws Exception;
		
		public int updateBoard(Board board) throws Exception;
		
		public int deleteBoard(Board board) throws Exception; 
		
		//public List<Board> listQaBoard(Map<String, Object> map) throws Exception;
		
		public List<Board> listBoard(Board board) throws Exception;
		
		public void addComment(Board board) throws Exception;
		
}
