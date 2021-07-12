package com.ogong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ogong.common.Search;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;
import com.ogong.service.domain.User;

@SpringBootTest
class BoardApplicationTest {

	@Autowired
	private BoardService boardService;

	
	
	  //@Test
	  @DisplayName("게시글 등록") 
	  void addBoard() throws Exception {
	  
	  
	  User user = new User(); 
	  user.setEmail("user01"); 
	  user.setNickname("뽀글이");
	  
	  Board board = new Board();
	  board.setBoardNo(1);
	  board.setWriter(user);
	  board.setBoardCategory("1");
	  board.setBoardTitle("안녕하세요");
	  board.setBoardContents("반갑습니다");
	  board.setBoardInterest("2");
	  board.setBoardRegDate(Date.valueOf("2021-07-10"));
	  board.setViewCount(0);
	  board.setCommentCount(0);
	  //board.setFileFlag(false);
	  
	  boardService.addBoard(board);
	  
	  System.out.println(board);
	  
	  }
	 
	 
	
	 // @Test
	  @DisplayName("게시글 조회") 
	  void getBoard() throws Exception {
	  
		  Board board = new Board(); 
		  board.setBoardNo(10001);
		  Board result = boardService.getBoard(board);
		   
		   System.out.println(result);
	 
	  }
	  
	  
	 // @Test
	  @DisplayName("게시글 수정") 
	  void updateBoard() throws Exception {
	  
		  Board board = new Board(); 
		  board.setBoardNo(10001);
		  board.setBoardTitle("제목수정");
		  board.setBoardContents("내용수정");
		  
		  int cnt = boardService.updateBoard(board);
		  if(cnt < 1) {
			  System.out.println("retry");
		  } else{
			  System.out.println("ok");
		  }
		  
	  }
	  
	  
	  // @Test
	  @DisplayName("게시글 삭제") 
	  void deleteBoard() throws Exception {
	  
		  Board board = new Board(); 
		  board.setBoardNo(10001);
		  
		  int cnt = boardService.deleteBoard(board);
		  if(cnt < 1) {
			  System.out.println("retry");
		  } else{
			  System.out.println("ok");
		  }
		  
		  
	  }
	  
	 // @Test
	  @DisplayName("게시글 목록") 
	  void listBoard() throws Exception {
	  
		  
		  Board board = new Board();
		  Search search = new Search();
		  board.setBoardCategory("1");
		  //board.setBoardInterest(null);
		  search.setCurrentPage(1);
		  search.setPageSize(2);
		  search.setSearchKeyword("안녕");
		  search.setSearchCondition("1");
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("board", board);
		  map.put("search", search);
		  List<Board> listBoard = boardService.listBoard(map);
		  
		  for(Board b: listBoard) {
			  System.out.println(b);
		  }
		  
	  }
	  
	  
	  @Test
	  @DisplayName("댓글 등록") 
	  void addComent() throws Exception {
		  
		  Board board = new Board();
		  User user = new User();
		  Comment comment = new Comment();
		  board.setBoardNo(10004);	  
		  user.setEmail("user03");
		  user.setNickname("뽀글이");
		  
		  comment.setCommentBoard(board);
		  comment.setCommentWriter(user);
		  comment.setCommentRegDate(Date.valueOf("2021-07-22"));
		  comment.setCommentContents("뽀글뽀글");
		  
		  boardService.addComment(comment);
		  
	  } 
}
