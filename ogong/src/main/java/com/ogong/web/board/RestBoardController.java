package com.ogong.web.board;
 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.common.Search;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;
import com.ogong.service.domain.User;

//@Controller
@RestController
@RequestMapping("/board/*")
public class RestBoardController {
    
    @Autowired
    BoardService boardService;
    
    @PostMapping("updateRecommend")
	public int updateRecommend(HttpServletRequest request, @RequestParam("boardNo") int boardNo) throws Exception {
		
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		
//		HttpSession session = request.getSession(true);
//		User user = (User)session.getAttribute("user");
//		board.setWriter(user);
		
		User user = new User();
		user.setEmail("user10");
		board.setWriter(user);
		int result = boardService.recommend(board);
		
		return result;
		
	}
    
    @GetMapping("listComment")
	public Map<String, Object> listComment(@RequestParam("boardNo") int boardNo, Search search) throws Exception {
		
    	Map<String, Object> map = boardService.listComment(boardNo, search);
    		
    	return map;
	}  
    
    @PostMapping("addComment")
	public Boolean addComment(HttpServletRequest request, HttpSession session, @RequestBody Comment comment) throws Exception {
    	
    	
    	
    	
    	User user = (User)session.getAttribute("user");
		
		comment.setCommentWriter(user);
		
		return boardService.addComment(comment);
    }
    
    @PostMapping("updateComment")
    
	public Boolean updateComment(HttpServletRequest request, @PathVariable("boardNo") int boardNo, @PathVariable("commentContents")
	String commentContents) throws Exception {	
    	
    	Comment comment = new Comment();
    	
    	comment.setBoardNo(boardNo);
    	comment.setCommentContents(commentContents);

    	
		return boardService.updateComment(comment);
    }
    
    @PostMapping("deleteComment")
	public Boolean deleteComment(HttpServletRequest request, @RequestBody Comment comment) throws Exception {
	
    	User user = new User();
		user.setEmail("user10");
		
		comment.setCommentWriter(user);
		
		return boardService.addComment(comment);
    }
    
    @GetMapping("listAnswer/{boardNo}")
	public List<Answer> listAnswer(@PathVariable("boardNo") int boardNo) throws Exception {
		
    	return boardService.listAnswer(boardNo);
    		
	}  
}