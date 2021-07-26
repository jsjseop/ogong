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
		$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/integration/listReceiveMessage").submit();
	}
	
			
	</script>   	
</head>
<body>
	
	<jsp:include page="../common/toolbar.jsp" />

	
	<div class="contatiner">
	
		<div class="page-header text-info">
	       		<h3>바나나 포인트</h3>
	    </div>
	    		
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

						<th align="left">바나나 획득경로</th>
						<th align="left">바나나 획득일자</th>
						<th align="left">바나나 획득수</th>
						<th align="left">내 현재 바나나</th>
					</tr>
				</thead>
				<tbody>

					<c:set var="i" value="0" />
					<c:forEach var="banana" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr id="trRemove">
							<td align="left">${banana.bananaHistory}</td>
							<td align="left">${banana.bananaHistoryDate}</td>
							<c:if test="${banana.bananaCategory == '1'}">
								<td align="left">+${banana.bananaAmount}</td>
							</c:if>
							<c:if test="${banana.bananaCategory == '2'}">
								<td align="left">${banana.bananaAmount}</td>
							</c:if>		
							<td align="left">${user.bananaCount}</td>					
						</tr>
					</c:forEach>
					

				</tbody>

			</table>	

	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>
