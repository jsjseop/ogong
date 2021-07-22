package com.ogong.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.board.BoardMapper;
import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.Board;
import com.ogong.service.domain.Comment;
import com.ogong.service.domain.Recommend;

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
	public Board getBoard(Board board) throws Exception {

		return boardMapper.getBoard(board);

	}

	// 게시글 수정
	public void updateBoard(Board board) throws Exception {

		boardMapper.updateBoard(board);

	}

	// 게시글 삭제
	public void deleteBoard(int boardNo) throws Exception {

		boardMapper.deleteBoard(boardNo);

	}

	// 게시글 목록
	public Map<String,Object> listBoard(Map<String, Object> map) throws Exception {
		
		Map<String ,Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("list", boardMapper.listBoard(map));
		resultMap.put("totalCount", boardMapper.getTotalCount(map));
		
		return resultMap;
	}

	// 댓글 등록
	public Boolean addComment(Comment comment) throws Exception {
		int cnt = boardMapper.addComment(comment);
		if (cnt > 0) {
			return true;
		}
		return false;
	}

	// 댓글 수정
	public Boolean updateComment(Comment comment) throws Exception {

		return boardMapper.updateComment(comment);
	}

	// 댓글 삭제
	public void deleteComment(int commentNo) throws Exception {
		boardMapper.deleteComment(commentNo);
	}

	// 댓글 목록
	public Map<String, Object> listComment(int boardNo, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("startRowNum", search.getStartRowNum());
		map.put("endRowNum", search.getEndRowNum());

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", boardMapper.listComment(map));
		result.put("listComment", boardMapper.listCommentCount(map));

		return result;
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

	/*
	 * public int getPageTotalCount(int totalCount) { int pageTotalCount = 0; if
	 * (totalCount != 0) { // ceil 올림 : totalCount 151 -> 16 pageTotalCount = (int)
	 * Math.ceil(((double) totalCount / NUM_OF_MESSAGE_PER_PAGE)); } return
	 * pageTotalCount; }
	 * 
	 * public int getStartPage(int currentPage) { return ((currentPage - 1) /
	 * NUM_OF_NAVI_PAGE) * NUM_OF_NAVI_PAGE + 1;
	 * 
	 * currentPage NUM_OF_NAVI_PAGE return 1 5 1 2 5 1 3 5 1 4 5 1 5 5 1 6 5 6
	 * 
	 * }
	 * 
	 * public int getEndPage(int currentPage) { return (((currentPage - 1) /
	 * NUM_OF_NAVI_PAGE) + 1) * NUM_OF_NAVI_PAGE;
	 * 
	 * currentPage NUM_OF_NAVI_PAGE return 1 5 5 2 5 5 3 5 5 4 5 5 5 5 5 6 5 10
	 * 
	 * }
	 */
	// 조회수
	public void updateViewcnt(int boardNo) throws Exception {

		boardMapper.updateViewcnt(boardNo);
	}

	// 추천수
	public int recommend(Board board) throws Exception {
		Recommend recommend = boardMapper.getRecommendNo(board);
		if (recommend != null) {
			boardMapper.deleteRecommend(recommend.getRecommendNo());
		} else {
			boardMapper.addRecommend(board);
		}

		int recommendCount = boardMapper.recommendCount(board);
		return recommendCount;
	}
	
	
	// 답변 목록
	public List<Answer> listAnswer(int boardNo) throws Exception {
	
		return boardMapper.listAnswer(boardNo);
	}


}
