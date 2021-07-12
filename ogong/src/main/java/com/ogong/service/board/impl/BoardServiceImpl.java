package com.ogong.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.board.BoardMapper;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;

@Service 
public class BoardServiceImpl implements BoardService{
	
	
	private static final int NUM_OF_MESSAGE_PER_PAGE = 5;
	private static final int NUM_OF_NAVI_PAGE = 3;
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public void addBoard(Board board) throws Exception {
		
			boardMapper.addBoard(board);
	}
	
	public Board getBoard(Board board) throws Exception {
			
			return boardMapper.getBoard(board);
	}
	
	public int updateBoard(Board board) throws Exception {
		
		int cnt = boardMapper.updateBoard(board);
		return cnt;
	}
	
	public int deleteBoard(Board board) throws Exception {
		
		int cnt = boardMapper.deleteBoard(board);
		return cnt;
	}
	
	/*
	 * public List<Board> listBoard(Board board) throws Exception {
	 * 
	 * return boardMapper.listBoard(board);
	 * 
	 * }
	 */
	
	public List<Board> listBoard(Map<String, Object> map) throws Exception {
		
		 return boardMapper.listBoard(map);
		
	}
	
	public void addComment(Comment comment) throws Exception {
		boardMapper.addComment(comment);
	}
	
	
	private int getPageTotalCount(int totalCount) {
		int pageTotalCount = 0;
		if(totalCount != 0) { //ceil 올림 : totalCount 151 -> 16
			pageTotalCount = (int)Math.ceil(((double)totalCount / NUM_OF_MESSAGE_PER_PAGE));
		}
		return pageTotalCount;
	}
	
	private int getStartPage(int currentPage) {
		return ((currentPage-1)/NUM_OF_NAVI_PAGE)*NUM_OF_NAVI_PAGE + 1;
		/*	currentPage		NUM_OF_NAVI_PAGE	return
		 * 	1				5					1				
		 * 	2				5					1
		 * 	3				5					1
		 * 	4				5					1
		 * 	5				5					1
		 * 	6				5					6
		 * */
	}
	
	private int getEndPage(int currentPage) {
		return  (((currentPage-1)/NUM_OF_NAVI_PAGE)+1)* NUM_OF_NAVI_PAGE;
		/*	currentPage		NUM_OF_NAVI_PAGE	return
		 * 	1				5					5				
		 * 	2				5					5
		 * 	3				5					5
		 * 	4				5					5
		 * 	5				5					5
		 * 	6				5					10
		 * */
	}
}
