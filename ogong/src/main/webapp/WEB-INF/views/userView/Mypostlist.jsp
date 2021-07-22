<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>내 게시물보기</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {

		$('#currentPage').val(currentPage);
		$('form').attr('action','/user/Mypostlist/').attr('method','POST').submit();
	}
	
	function fncWrite(user) {


		location.href = "/board/addBoard";
	}

	$(function() {

		$('tbody td:nth-child(2)').on('click', function() {

			let boardNo = $(this).children('input').val();
			location.href = "/board/getBoard?boardNo=" + boardNo;
		})
		
		$('button:contains("검색")').on('click', function(){
			
			fncGetList('1');
		})
		
	})
	
	$(function(){
			
			 $("#searchKeyword").keydown(function (key) {
			 
		        if(key.keyCode == 13){
		        	fncGetList('1');
		        }
		    });
		});
</script>
<style>
body {
	padding-top: 30px;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-default">
			<h3>내 게시물 보기</h3>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

				


					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div>
		</div>

		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">제목</th>
					<th align="left">작성자</th>
					<th align="left">등록일</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="board" items="${list}">
					<tr>
						<td align="center">${board.boardNo}</td>
						<td align="left">${board.boardTitle}<input type="hidden"
							value="${board.boardNo}" /></td>
						<td align="left">${writer.email}</td>
						<td align="left">${board.boardRegDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
				<jsp:include page="../common/pageNavigator.jsp" />
	</div>
</body>
</html>