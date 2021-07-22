<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
	<script type="text/javascript">
	function fncGetList(currentPage) {
		/* alert($("#searchCondition").val()); */
		$("#currentPage").val(currentPage)
		$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listUserReport").submit();
	}
	
	
	function fncupdateUserSuspend(email){
		
		
		$("form[name='updateSuspendUser']").attr("method", "POST").attr("action", "/admin/updateSuspendUser").submit();
		}
		
		$('.radio-value').on('click', function() {
		    var suspendType = $('.radio-value:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
		    
		    if ( suspendType == '1' ) {
		        $('.radio-value-detail').attr('suspendType', 1);
		        $('.radio-value-detail').focus(); 
		    } else if ( suspendType == '2' ) {
		        $('.radio-value-detail').attr('suspendType', 2); 
		        $('.radio-value-detail').focus();
		    } else if ( suspendType == '3' ) {
		        $('.radio-value-detail').attr('suspendType', 3);
		        $('.radio-value-detail').focus(); 
		    }
		});	

	
	$(function(){
	
		// 정지 
 		$( "#btn1" ).on("click" , function() {
			var email = $('#email2').val()
			/* alert(email);	 */		
			fncupdateUserSuspend(email)
		}); 
		
		// 기억해_
	    $('tr td:nth-child(5)').on("click", function(){
	    	$('#email').val($(this).find('input').val());	    	
	    })
		
		
 		$('#modal').modal("hide"); //닫기 
		 
		$('#modal').modal("show"); //열기 
		
		
		$("button[name='search']").on("click", function(){
			fncGetList(1);
		});	
		
	/*$("td:contains('정지')").on("click", function(){
			 fncupdateUserSuspend() 
			var email = $(this).find('input').val()
			alert(email);
			location.href = "/admin/updateSuspendUser?receiveReporter="+$(this).attr('email');
		});*/ 
		
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
	       		<h3>신고된 사용자 목록 조회</h3>
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
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>닉네임</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" name="search" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>		    
	    	
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    	<thead>
	    		<tr>	       		
	       					<th align="center">No</th>
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
		  			<td align="left">${report.reportReason}</td>
		  			<td align="left">${report.receiveReporter.nickname}</td>
		  			<td align="left">${report.reportDate}</td>
		  			<td align="left" email="${report.receiveReporter.email}">
		  			<c:if test="${report.receiveReporter.condition eq '1'}">
						<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						  <input type="hidden" name="email2" id="email2" value="${report.receiveReporter.email}"/>
						   정지
						</button>
		  			</c:if>
		  			<c:if test="${report.receiveReporter.condition eq '2'}">
		  				정지완료
		  			</c:if>
		  			</td>
		  			</tr>
		  		</c:forEach>
	    	</tbody>
	    	
	    </table>
	    
	    
	    
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">사용자 정지</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" method="post" name="updateSuspendUser">
		        	<input type="hidden" id="email" name="email" value="${report.receiveReporter.email}"/>   
		        	<div class = "form-group">
					  <fieldset>
			   				 <legend>정지 일자 선택 </legend>
			   				 <label for="radio-1 ">7일</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="1">
			   				 <label for="radio-2">30일</label>
			   				 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="2">
			   				 <label for="radio-3">영구정지</label>
			    			 <input type="radio" class="radio-value" name="suspendType" id="suspendType" value="3">
			  			</fieldset>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="btn1" class="btn btn-default" >정 지</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫 기</button>
		      </div>
		    </div>
		  </div>
		 </div>	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>





