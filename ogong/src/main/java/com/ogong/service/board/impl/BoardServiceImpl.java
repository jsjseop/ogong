package com.ogong.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.service.board.BoardMapper;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;

@Service
public class BoardServiceImpl implements BoardService {

	private static final int NUM_OF_MESSAGE_PER_PAGE = 5;
	private static final int NUM_OF_NAVI_PAGE = 3;

	@Autowired
	BoardMapper boardMapper;

	// 게시글 등록
	@Override
	public void addBoard(Board board) throws Exception {

		boardMapper.addBoard(board);
	}

	// 게시글+댓글 조회
	public Map<String, Object> getBoard(Board board) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", boardMapper.getBoard(board));

		List<Comment> list = boardMapper.listComment(board.getBoardNo());
		map.put("listComment", list);

		return map;

	}

	// 게시글 수정
	public void updateBoard(Board board) throws Exception {

		boardMapper.updateBoard(board);

	}

	// 게시글 삭제
	public void deleteBoard(Board board) throws Exception {

		boardMapper.deleteBoard(board);

	}

	// 게시글 목록
	public List<Board> listBoard(Map<String, Object> map) throws Exception {

		return boardMapper.listBoard(map);

	}

	// 댓글 등록
	public void addComment(Comment comment) throws Exception {
		boardMapper.addComment(comment);
	}

	// 댓글 수정
	public void updateComment(Comment comment) throws Exception {
		boardMapper.updateComment(comment);
	}

	// 댓글 삭제
	public void deleteComment(int commentNo) throws Exception {
		boardMapper.deleteComment(commentNo);
	}

	// 댓글 목록
	public Map<String, Object> listComment(int boardNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", boardMapper.listComment(boardNo));
		map.put("totalCount", boardMapper.listComment(boardNo).size());

		return map;
	}

//	Q&A 답변 등록
	public void addAnswer(Answer answer) throws Exception {
		boardMapper.addAnswer(answer);
	}

	// Q&A 답변 수정
	public void updateAnswer(Answer answer) throws Exception {
		boardMapper.updateAnswer(answer);
	}

	// Q&A 답변 삭제
	public void deleteAnswer(int answerNo) throws Exception {
		boardMapper.deleteAnswer(answerNo);
	}

	private int getPageTotalCount(int totalCount) {
		int pageTotalCount = 0;
		if (totalCount != 0) { // ceil 올림 : totalCount 151 -> 16
			pageTotalCount = (int) Math.ceil(((double) totalCount / NUM_OF_MESSAGE_PER_PAGE));
		}
		return pageTotalCount;
	}

	private int getStartPage(int currentPage) {
		return ((currentPage - 1) / NUM_OF_NAVI_PAGE) * NUM_OF_NAVI_PAGE + 1;
		/*
		 * currentPage NUM_OF_NAVI_PAGE return 1 5 1 2 5 1 3 5 1 4 5 1 5 5 1 6 5 6
		 */
	}

	private int getEndPage(int currentPage) {
		return (((currentPage - 1) / NUM_OF_NAVI_PAGE) + 1) * NUM_OF_NAVI_PAGE;
		/*
		 * currentPage NUM_OF_NAVI_PAGE return 1 5 5 2 5 5 3 5 5 4 5 5 5 5 5 6 5 10
		 */
	}

}
