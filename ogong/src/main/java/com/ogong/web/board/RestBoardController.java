package com.ogong.web.board;
 
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ogong.common.Search;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;
import com.ogong.service.domain.File;
import com.ogong.service.domain.User;

//@Controller
@RestController
@RequestMapping("/board/*")
public class RestBoardController {
    
    @Autowired
    BoardService boardService;


	@PostMapping("/json/addBoard")
	public int addBoard(MultipartHttpServletRequest request, @ModelAttribute("board") Board board) throws Exception {
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println("파일리스트~~~"+fileList);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		board.setWriter(user);

		int result = boardService.addBoard(board, fileList);
		return result;  
	}
    
    
    @PostMapping("updateRecommend")
	public int updateRecommend(HttpServletRequest request, @RequestParam("boardNo") int boardNo) throws Exception {
		String commentNo = "a";	
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
	public Boolean updateComment(HttpServletRequest request, @RequestBody Comment comment) throws Exception {	
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("user");
    	comment.setCommentWriter(user);
    	
    	boardService.updateComment(comment);
    	
		return true;
    }
    
    @PostMapping("deleteComment")
	public Boolean deleteComment(HttpServletRequest request, @RequestBody Comment comment) throws Exception {	
    	HttpSession session = request.getSession();
    	User user = (User)session.getAttribute("user");
    	comment.setCommentWriter(user);
		
		return boardService.deleteComment(comment);
    }
    
    @GetMapping("listAnswer/{boardNo}")
	public List<Answer> listAnswer(@PathVariable int boardNo) throws Exception {		
    	List<Answer> list = boardService.listAnswer(boardNo);
    	
    	return list;
	}  
    
    @GetMapping("fileDown")
   	public void fileDown(HttpServletResponse response, @RequestParam("fileNo") int fileNo) throws Exception {		
    	File file = new File();
    	file.setFileNo(fileNo);
    	boardService.fileDown(response, file);
   	}  
}