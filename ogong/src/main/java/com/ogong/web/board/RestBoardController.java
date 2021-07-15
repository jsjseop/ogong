package com.ogong.web.board;
 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.service.board.BoardService;
import com.ogong.service.domain.Comment;

//@Controller
@RestController
@RequestMapping("/comment/*")
public class RestBoardController {
    
    @Autowired
    BoardService boardService;
    
    // 댓글 입력
    @RequestMapping("addComment.do")
    public void insert(@ModelAttribute Comment comment, HttpSession session) throws Exception{
        String userId = (String) session.getAttribute("userId");
        comment.setCommentContents(userId);
        boardService.addComment(comment);
    }
    
    // 댓글입력 (Rest방식으로 json전달하여 글쓰기)
    // @ResponseEntity : 데이터 + http status code
    // @ResponseBody : 객체를 json으로 (json - String)
    // @RequestBody : json을 객체로
    @RequestMapping(value="addComment.do", method=RequestMethod.POST)
    public ResponseEntity<String> insertRest(@RequestBody Comment comment, HttpSession session){
        ResponseEntity<String> entity = null;
        try {
            String userId = (String) session.getAttribute("userId");
            comment.setCommentContents(userId);
            boardService.addComment(comment);
            // 댓글입력이 성공하면 성공메시지 저장
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 댓글입력이 실패하면 실패메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 입력 처리 HTTP 상태 메시지 리턴
        return entity;
    }
    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    /*@RequestMapping("listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<ReplyVO> listJson(@RequestParam int bno, @RequestParam(defaultValue="1") int curPage){
        int count = 10;
        BoardPager pager = new BoardPager(count, curPage);
        int start = pager.getPageBegin();
        int end = pager.getPageEnd();
        List<ReplyVO> list = replyService.list(bno, start, end);
        return list;
    }*/
}
 