<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    


	<script type="text/javascript">

	
	function fncAddReport(){
		//Form 유효성 검증

		var receiveReporter = "${report.receiveReporter}";
		
		
		
		alert(sender);
		alert(receiver);
		alert(messageContents);
		
		if(receiver == null || receiver.length<1){
			alert("수신자 이메일은 반드시 입력해야 합니다.");
			return;
		}
		
		if(messageContents == null || messageContents.length<1){
			alert("보낼 내용은 반드시 입력해야 합니다.");
			return;
		} 
		
		alert("쪽지를 성공적으로 보냈습니다.");
		
		$("form[name='addReport']").attr("method", "POST").attr("action", "/admin/addReport").submit();
		
	}
	
	
	
	$(function(){
		
		// 신고
		$( "#btn2" ).on("click" , function() {
			fncAddSendMessage2();
		});
		


	})
	
	
	</script>   	

	

	
	
	
	<%-- <jsp:include page="../common/toolbar.jsp" /> --%>


<div class="contatiner">
	<!-- Modal 신고 하기-->
	<form name="addReport">
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
						<input type="hidden" class="sendReporter" name="sendReporter"/>

						<div class="form-group" >
							<label>작성자 이메일</label>
							<input type="text" class="form-control" id="receiveReporter" name="report.receiveReporter.email" 
							maxLength="512" style="height: 30px" value="" readonly></input>
						</div>
						<c:if test = "${ !empty board.boarTitle }">
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
						</c:if>													
						<div class="form-group">
							<label>신고사유</label>
							<textarea type="text" class="form-control" id="reportReason" name="reportReason" maxLength="2048" style="height: 180px" placeholder="신고사유를 입력해 주세요."></textarea>
						</div>
					</form>
				</div>
					<div class="modal-footer">
						<button id="btn2" class="btn btn-default">신고하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


