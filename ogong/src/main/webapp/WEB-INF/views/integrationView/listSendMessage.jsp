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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/adminView/listUserReport").submit();
	}
	
	function fncupdateSuspendUser(){
		
		
		$("form").attr("method" , "POST").attr("action" , "/admin/updateSuspendUser").submit();
		
	}
	
	$(function(){
		// 검색
		$( "td.ct_btn01:contains('검색')").on("click", function(){
			fncGetList(1);
		});	
		
	 	$( "a:contains('보낸쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listSendMessage";
		});
	 	
	 	$( "a:contains('받은쪽지함')" ).on("click" , function() {
	 		location.href = "/integration/listReceiveMessage";
	 	});
	})
	
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
	       		<h3>보낸 쪽지</h3>
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">보낸쪽지함</a></li>
  			<li role="presentation"><a href="#">받은쪽지함</a></li>
		</ul>
	    
	    <div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>
			</div>
			<div class="col-md-5 text-right">
				<input type="submit" class="deleteMessage" name="cmd" value="삭제">
			</div>
		</div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
	       					<th align="left">쪽지내용</th>
	       					<th align="left">전송일자</th>
	       					<th align="left">삭제</th>
	    		</tr>
	    	</thead>
	    	<tbody>
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="message" items="${list}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
		  			<td align="center">${ i }</td>
		  			<td align="left">${message.messageContents}</td>
		  			<td align="left">${message.sendDate}</td>
		  			<td align="left"><input type="checkbox" name="del" value="${message.messageNo}"></td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    			
	    </table>
	    
	  	 <ul class="nav nav-tabs" name='btn' style="float: right;">
  			<li role="presentation"><a href="#">쪽지보내기</a></li>
		</ul>
	    	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>