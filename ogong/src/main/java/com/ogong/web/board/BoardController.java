package com.ogong.web.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.ogong.common.Page;
import com.ogong.common.Search;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.User;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Value("5")
	int pageUnit;
	
	@Value("3")
	int pageSize;

	@Autowired
	private BoardService boardService;

	@GetMapping("addBoard")
	public String addBoard(@RequestParam("boardCategory") String boardCategory, Model model) throws Exception {
		model.addAttribute("boardCategory", boardCategory);
		
		if(boardCategory.equals("2")) {
			return "boardView/addQaBoard";
		}
		return "/boardView/addBoard";
	}

	@PostMapping("addBoard")
	public String addBoard(@ModelAttribute("board") Board board, @RequestParam ("boardCategory") String boardCategory,
			@ModelAttribute("user") User user, Model model)
			throws Exception {

		user.setEmail("user01");
		board.setWriter(user);;
		board.setBoardInterest("2");
		board.setFileFlag("2");
		board.setBoardCategory(boardCategory);
		
		boardService.addBoard(board);
		System.out.println(board);

		// model.addAttribute("boardCategory", board.);
		model.addAttribute("board", board);
		model.addAttribute("boardCategory", boardCategory);
		
		if(boardCategory.equals("2")) {
			return "redirect:board/getBoard/getBoard?boardNo=" + board.getBoardNo();
		}

		return "redirect:/board/getBoard?boardNo=" + board.getBoardNo();
	}

	
	/*
	 * @GetMapping("addAnswer") public String addAnswer(@RequestParam("boardNo") int
	 * boardNo, Model model) throws Exception {
	 * 
	 * Board board = new Board(); board.setBoardNo(boardNo);
	 * 
	 * board = boardService.getBoard(board);
	 * 
	 * 
	 * model.addAttribute("board", board);
	 * 
	 * return "/boardView/addAnswer"; }
	 */

	
	@PostMapping("addAnswer")
	public String addAnswer(@ModelAttribute("board") Board board, @RequestParam ("boardCategory") String boardCategory,
			@ModelAttribute("user") User user, Model model)
			throws Exception {

		user.setEmail("user01");
		board.setWriter(user);;
		board.setBoardInterest("2");
		board.setFileFlag("2");
		board.setBoardCategory(boardCategory);
		
		boardService.addBoard(board);
		System.out.println(board);

		// model.addAttribute("boardCategory", board.);
		model.addAttribute("board", board);
		model.addAttribute("boardCategory", boardCategory);
		
		if(boardCategory.equals("2")) {
			return "redirect:board/getBoard/getBoard?boardNo=" + board.getBoardNo();
		}

		return "redirect:/board/getBoard?boardNo=" + board.getBoardNo();
	}
	
	
	
	
	
	
	@GetMapping("getBoard")
	public String getBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {
		//, @RequestParam("boardCategory") String boardCategory
		System.out.println("boardNo" + boardNo);

		boardService.updateViewcnt(boardNo);
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		//board.setBoardCategory(null);
		
		board = boardService.getBoard(board); 
		
		model.addAttribute("board", board);

		
		if (board.getBoardCategory().equals("2")) {
			
		return "/boardView/getQaBoard";
		}
		return "/boardView/getBoard";
	}
		


	@RequestMapping(value = "deleteBoard")
	public String deleteProduct(@RequestParam("boardNo") int boardNo, Model model,
			@RequestParam("boardCategory") String boardCategory)
			throws Exception {
			
		boardService.deleteBoard(boardNo);
		
		model.addAttribute("boardCategory", boardCategory);
			
		return "forward:/board/listBoard";				
	}

	
	@GetMapping("updateBoard")
	public String updateBoard(@RequestParam("boardNo") int boardNo, Model model) throws Exception {

		Board board = new Board();
		board.setBoardNo(boardNo);

		board =	boardService.getBoard(board);

		model.addAttribute("board", board);
		return "/boardView/updateBoard";
	}

	@PostMapping("updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board, Model model) throws Exception {

		boardService.updateBoard(board);

		return "redirect:/board/getBoard?boardNo=" + board.getBoardNo();
	}

	@RequestMapping("listBoard")
	public String listBoard(@ModelAttribute("search") Search search,
			@RequestParam("boardCategory") String boardCategory, Model model, HttpServletRequest request)
			throws Exception {

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Board board = new Board();
		board.setBoardCategory(boardCategory);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("board", board);

		Map<String, Object> resultMap = boardService.listBoard(map);
		
		Page resultPage = new Page(search.getCurrentPage(), 
			((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
			pageSize);
		
		System.out.println(resultPage);	
		
		
		model.addAttribute("list",resultMap.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("boardCategory", boardCategory);
		model.addAttribute("resultPage", resultPage);
		
		if (boardCategory.equals("2")) {

			return "/boardView/listQaBoard";
		}
		if (boardCategory.equals("5")) {

			return "/boardView/studyBoard";
		}
			
		return "/boardView/listBoard";
	}

	
	//파일 업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		
		// UUID 확장자로 저장될 savedFileName
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//실패시 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
}
