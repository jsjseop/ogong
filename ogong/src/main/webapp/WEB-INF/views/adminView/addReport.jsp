<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    



<script type="text/javascript">

	
	function fncAddReport(){
		//Form 유효성 검증

		/* var sendReporter = "${report.receiveReporter}"; */
		var receiveReporter = $("input[name='receiveReporter.email']").val();
		if($("input[name='reportBoard.boardNo']").val() == null){
			var reportBoard = null
		}else if($("input[name='reportBoard.boardNo']").val() != null){
			var reportBoard = $("input[name='reportBoard.boardNo']").val();
		}
			
		var reportReason = $("textarea[name='reportReason']").val();
		
		
		alert(receiveReporter);
		alert(reportBoard);
		alert(reportReason);

		

		
		if(reportReason == null || reportReason.length<1){
			alert("신고 사유는 반드시 입력해야 합니다.");
			return;
		} 
		
		alert("신고가 완료되었습니다.");
		
		$("form[name='addReport']").attr("method", "POST").attr("action", "/admin/addReport").submit();
		
	}
	
	
	
	$(function(){
		
		// 신고
		$( "#btn3" ).on("click" , function() {
			fncAddReport();
		});
		


	})
	
	
	</script>   	

	

	
	
	
	<%-- <jsp:include page="../common/toolbar.jsp" /> --%>


<div class="contatiner">
	<!-- Modal 신고 하기-->
	<form name="addReport">
	  

	 
		<%-- <input type="hidden" class="receiveReporter" name="receiveReporter" value="${report.receiveReporter.email}"/> --%>
		<div class="modal fade" id="myModalReport" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">신고 하기</h4>
					</div>
					<div class="modal-body">
						<form>
						

						<div class="form-group" >
							<label>작성자 이메일</label>
							<input type="text" class="form-control" id="receiveReporter" name="receiveReporter.email" 
							maxLength="512" style="height: 30px" value="${board.writer.email}" ></input>
						</div>
						<div class="form-group" >
							<c:if test = "${!empty board.boardTitle}">
							<input type="hidden" id="boardEmail" name="reportBoard.boardEmail"  value="${board.writer.email}" />
							<input type="hidden" id="boardNo"    name="reportBoard.boardNo"  value="${board.boardNo}" />							
							<label>게시글 제목</label>
							<input type="text" class="form-control" id="boardTitle" name="reportBoard.boardTitle" 
							maxLength="512" style="height: 30px" value="${board.boardTitle}" readonly></input>
							</c:if>
							<c:if test = "${!empty answer.answerTitle}">
							<label>게시글 제목</label>
							<input type="text" class="form-control" id="answerTitle" name="reportAnswer.answerTitle" 
							maxLength="512" style="height: 30px" value="${answer.answerTitle}" readonly></input>
							</c:if>							
						</div>						
						
						
<%-- 						<c:if test = "${ !empty board.boarTitle }">
							<div class="form-group" >
								<label>게시글 제목</label>
								<input type="text" class="form-control" id="boardTitle" name="baord.boardTitle" 
								maxLength="512" style="height: 30px" value="" readonly></input>
							</div>
						</c:if>
						<c:if test = "${ !empty answer.answerTitle }">
							<div class="form-group" >
								<label>게시글 제목</label>
								<input type="text" class="form-control" id="answerTitle" name="answer.answerTitle" 
								maxLength="512" style="height: 30px" value="" readonly></input>
							</div>
						</c:if>
						<c:if test = "${ !empty comment.commentContents }">
							<div class="form-group" >
								<label>댓글 내용</label>
								<input type="text" class="form-control" id="commentContents" name="comment.commentContents" 
								maxLength="512" style="height: 30px" value="" readonly></input>
							</div>
						</c:if> --%>													
						<div class="form-group">
							<label>신고사유</label>
							<textarea type="text" class="form-control" id="reportReason" name="reportReason" maxLength="2048" style="height: 180px" placeholder="신고사유를 입력해 주세요."></textarea>
						</div>
					</form>
				</div>
					<div class="modal-footer">
						<button id="btn3" class="btn btn-default">신고하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


