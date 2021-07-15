<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset = "EUC-KR">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 50px;
        }
   	</style>
   
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetList(currentPage) {
		$("input[name='currentPage']").val(currentPage)
		$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/adminView/listReport").submit();
	}
	
	
	
	$(function(){
		// 검색
		$( "td.ct_btn01:contains('검색')").on("click", function(){
			fncGetList(1);
		});	
		
		$("td:contains('정지')").on("click", function(){
			/* fncupdateUserSuspend() */
			var email = $(this).find('input').val()
			alert(email);
			location.href = "/admin/updateSuspendUser?receiveReporter="+$(this).attr('email');
		});
		
	 	
	 	$( "a:contains('신고된 사용자 목록')" ).on("click" , function() {
	 		location.href = "/admin/listUserReport";
		});
	 	
	 	$( "a:contains('신고된 게시글 목록')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+1;
		});
	 	
	 	$( "a:contains('신고된 답변 목록')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+2;
		});
	 	
	 	$( "a:contains('신고된 댓글 목록')" ).on("click" , function() {
	 		location.href = "/admin/listReport?reportType="+3;
		});	
		
	})
	
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />
	
	<div class="contatiner">
	
		<div class="page-header text-info">
		
	       		<c:if test="${reportType == 1}">
	       				<h3>신고된 게시글 목록</h3>
	       		</c:if>
	       		<c:if test="${reportType == 2}">
	       				<h3>신고된 답변 목록</h3>
	       		</c:if>
	       		<c:if test="${reportType == 3}">
	       				<h3>신고된 댓글 목록</h3>
	       		</c:if>
	       		
	    </div>
	    
	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">신고된 사용자 목록</a></li>
  			<li role="presentation"><a href="#">신고된 게시글 목록</a></li>
  			<li role="presentation"><a href="#">신고된 답변 목록</a></li>
  			<li role="presentation"><a href="#">신고된 댓글 목록</a></li>
		</ul>
	    
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
								<option value="0" ${ search.searchCondition eq '0' ? 'selected' : '' }>닉네임</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>		    
	    	
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
	       				<c:if test="${reportType == 1}">
	       					<th align="left">게시글제목</th>
	       				</c:if>
	       				<c:if test="${reportType == 2}">
	       					<th align="left">답변내용</th>
	       				</c:if>
	       				<c:if test="${reportType == 3}">
	       					<th align="left">댓글내용</th>
	       				</c:if>
	       					<th align="left">신고사유</th>
	       					<th align="left">닉네임</th>
	       					<th align="left">신고일자</th>
	       					<th align="left">정지</th>
	    		</tr>
	    	</thead>
	    	
	    	<tbody class="ct_list_pop">
		 	 	<c:set var="i" value="0" />
		  		<c:forEach var="report" items="${list}">
		  			<c:set var="i" value="${ i+1 }" />
		  			<tr>
		  			<td align="center">${ i }</td>
		  			<td align="left">
		  			<c:if test="${reportType == 1}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportBoard.boardTitle}</div>
		  			</c:if>
		  			<c:if test="${reportType == 2}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportAnswer.answerContents}</div>
		  			</c:if>
		  			<c:if test="${reportType == 3}">
		  				<div class="report"	reportNo="${report.reportNo}">${report.reportComment.commentContents}</div>
		  			</c:if>		  					  			
		  			</td>
		  			<td align="left">${report.reportReason}</td>
		  			<td align="left">${report.receiveReporter.nickname}</td>
		  			<td align="left">${report.reportDate}</td>
		  			
		  			<td align="left" email="${report.receiveReporter.email}">
		  			<c:if test="${report.receiveReporter.condition eq '1'}">
		  				정지
		  			</c:if>
		  			<c:if test="${report.receiveReporter.condition eq '2'}">
		  				정지완료
		  			</c:if>
		  			<input type="hidden" name="email" value="${report.receiveReporter.email}"/>
		  			</td>
		  				
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    	
	    </table>
	    
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>





