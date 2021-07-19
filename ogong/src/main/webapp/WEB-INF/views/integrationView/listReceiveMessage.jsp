<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/integration/listReceiveMessage").submit();
	}
	
	function fncAddSendMessage(){
		//Form 유효성 검증

		var sender = "${message.sender.email}";
		var receiver = $("textarea[name='receiver.email']").val();
		var messageContents = $("textarea[name='messageContents']").val();
		
		
	/* 	if(receiver == null || receiver.length<1){
			alert("수신자 이메일은 반드시 입력해야 합니다.");
			alert(receiver);
			return;
		}
		
		if(messageContents == null || messageContents.length<1){
			alert("보낼 내용은 반드시 입력해야 합니다.");
			alert(messageContents);
			return;
		} */
		alert(sender);
		alert(receiver);
		alert(messageContents);
		
		$("form").attr("method", "POST").attr("action", "/integration/addSendMessage").submit();
		
	}
	
	
	
	$(function(){
		
		// 쪽지 전송
		$( "#btn1" ).on("click" , function() {
			fncAddSendMessage();
		});
		
	 	$( "a:contains('보낸쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	$( "a:contains('받은쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
		});
	 	
	 	/* $( "a:contains('쪽지보내기')" ).on("click" , function() {
	 		location.href = "/integration/addSendMessage";
	 	}); */

 		$(".selectDelete_btn").on("click" , function() {
 		 	var confirm_val = confirm("정말 삭제하시겠습니까?");
 		 	/* var messageNo = $("input[name='chBox']").val(); */
 		 	
  			if(confirm_val) {
 			  var messageArr = new Array();
   				
 		 	 $("input[class='messageNo']:checked").each(function(){
 		 		messageArr.push($(this).val());
   				alert(messageArr);
 			 });
 		 	 
 		  		$.ajax({
  			 	 url : "/integration/deleteTest",
	  		  	 type : "POST",
  		  	 	 data : { messageNo : messageArr },
    		 	 success : function(result){
   		   	 	 	if(result == 1){
    		 		 	location.href = "/integration/listSendMessage";
   		   	 	 	} else {
   		   	 	 		alert("삭제 실패")
   		   	 	 	}
  		  	 	}
  		  		});
 		   } 
 		});
 		
 		$(".deleteMessage").on("click" , function() {
 			alert("asd");
			var messageDelete = $(this).val()
			alert(messageDelete);
 			
			$.ajax({
				
				url : "/integration/json/deleteMessage/"+messageDelete,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status){
					
				}
			});
 			$('.deleteMessage').remove();
 		});

		$('#modal').modal("hide"); //닫기 
		 
		$('#modal').modal("show"); //열기

	})
	
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
	       		<h3>받은 쪽지</h3>
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">보낸쪽지함</a></li>
  			<li role="presentation"><a href="#">받은쪽지함</a></li>
  			
		</ul>

		
			<div class="row">

				<div class="col-md-6 text-left">
					<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>
				</div>

			    <div class="col-md-6 text-right">
				    <form class="form-inline" name="detailForm">
				      
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
		    	</div>				
				
			</div>

			<table class="table table-hover table-striped">

				<thead>
					<tr>
						<th align="center">No</th>
						<th align="left">쪽지내용</th>
						<th align="left">발신자 이메일</th>
						<th align="left">전송일자</th>
						<th align="left">
	       						<div class="delBtn">
	       							<button type="button" class="selectDelete_btn">선택삭제</button>
	       						</div>	       					
	       						<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
										<script>
											$("#allCheck").click(function() {
												var chk = $("#allCheck").prop("checked");
												if (chk) {
													$('.messageNo').prop("checked", true);
												} else {
													$('.messageNo').prop("checked", false);
												}
											});
										</script>
								</div>
					</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="message" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
							<td align="center">${ i }</td>
							<td align="left">${message.messageContents}</td>
							<td align="left">${message.sender.email}</td>
							<td align="left">${message.sendDate}</td>
				  			<td align="left">
				  				<div class="checkBox">
				  					<input type="checkbox" class="messageNo" name="messageNo"  value="${message.messageNo}"/>
										<script>
											$(".messageNo").click(function() {
												$("#allCheck").prop("checked", false);
											});
										</script>		  					
								</div>
							</td>
							<td align="left">
								<div class="delete">
		    						<button type="button" class="deleteMessage" name="deleteMessage"  value="${message.messageNo}">삭제</button>
		   						</div>
				  			</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		 <ul class="nav nav-tabs" name='send' style="float: right;">
	  				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  쪽지보내기
					</button>
		</ul>
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">쪽지 보내기</h4>
		      </div>
		      <div class="modal-body">
		        <form>
		        	<input type="hidden" name="studyNo" value="">     
		        	<div class = "form-group">
		        		<label>발신자 이메일</label>
		        		<label type="hidden" class="form-control" id="message.sender.email" name="sender.email"  maxLength="512" style="height:30px" >
		        			${message.sender.email}
		        		</label>
		        	</div>
		        	<div class = "form-group">
		        		<label>수신자 이메일</label>
		        		<textarea type="text" class="form-control" id="message.receiver.email" name="receiver.email" maxLength="512" style="height:30px" placeholder="받는 사람 이메일을 입력하세요"></textarea>
		        	</div>		        	
		        	<div class = "form-group">
		        		<label>내용</label>
		        		<textarea type="text" class="form-control" id="messageContents" name="messageContents" maxLength="2048" style="height:180px" placeholder="내용을 입력해 주세요."></textarea>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="btn1" class="btn btn-default" >전송하기</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫 기</button>
		      </div>
		    </div>
		  </div>
		 </div>		
		
		

	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>








