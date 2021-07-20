package com.ogong.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogong.common.Search;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.User;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;


	@GetMapping("addBoard" )
	public String addBoard() throws Exception {

		return "/boardView/addBoard";
	}

	@PostMapping("addBoard")
	public String addBoard(@ModelAttribute("board") Board board,
							@ModelAttribute("user") User user, Model model) throws Exception {

		user.setEmail("user01");
		board.setWriter(user);
		board.setBoardCategory("1");
		board.setBoardInterest("2");
		board.setFileFlag("2");
		
		boardService.addBoard(board);
		System.out.println(board);
		
		return "redirect:/board/getBoard?boardNo="+board.getBoardNo();
	}

	
	@GetMapping ("getBoard")
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {

		System.out.println("boardNo"+boardNo);
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		Map<String, Object> map = boardService.getBoard(board);
		System.out.println(map);
		
		model.addAttribute("board", map);
		return "/boardView/getBoard";
	}
	
	
	@RequestMapping(value = "deleteBoard")
	public String deleteProduct(@RequestParam("boardNo") int boardNo) throws Exception {

		
		boardService.deleteBoard(boardNo);

		return "forward:/board/listBoard";
	}
	
	@GetMapping("updateBoard" )
	public String updateBoard(@RequestParam ("boardNo") int boardNo, Model model) throws Exception {

		Board board = new Board();
		board.setBoardNo(boardNo);
		
		boardService.getBoard(board);
		
		Map<String, Object> map = boardService.getBoard(board);
		System.out.println(map); 
		
		model.addAttribute("board",map.get("board"));
		
		
		return "/boardView/updateBoard";
	}

	@PostMapping("updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board, Model model) throws Exception {

		
		boardService.updateBoard(board);
		
		return "redirect:/board/getBoard?boardNo="+board.getBoardNo();
	}
	

	@RequestMapping("listBoard")
	public String listBoard(@ModelAttribute("search") Search search, Model model,
			 HttpServletRequest request) throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(5);
		
		search.setSearchKeyword("");
		search.setSearchCondition("");
		

		Board board = new Board();
		board.setBoardCategory("1");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("board",board);
		
		List<Board> list = boardService.listBoard(map);
		map.get("totalCount");
	
		
			
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		
		return "/boardView/listBoard";
	}
	
	
}
