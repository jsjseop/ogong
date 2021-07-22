<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<title>Q&A 게시판</title>

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
		$('form').attr('action','/board/listQaBoard/').attr('method','POST').submit();
	}
	
	function fncWrite(user) {
		
		location.href = "/board/addBoard?boardCategory="+`${boardCategory}`;
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
				<c:if test="${boardCategory == '1'}">
	       				<h3>정보공유 게시판</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '2'}">
	       				<h3>Q&A 게시판</h3>
	       		</c:if>

	       		<c:if test="${boardCategory == '3'}">
	       				<h3>합격후기 게시판</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '4'}">
	       				<h3>자유 게시판</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '5'}">
	       				<h3>자율스터디 모집 게시판</h3>
	       		</c:if>
	       		<c:if test="${boardCategory == '6'}">
	       				<h3>파일공유 게시판</h3>
	       		</c:if>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">
	<div align="center" id="bbs" class="col-md-10 offset-md-1">
		<h1>Q&A 게시판</h1>

			<!-- 검색 폼 시작--------------------- -->
		<form name="sf" action="find" onsubmit="return check()">
			<div class="row m-4">
				<div class="col-md-2">
					<select name="findType" class="form-control">
						<option value="">::검색 유형::</option>
						<option value="1">글제목</option>
						<option value="2">작성자</option>
						<option value="3">글내용</option>
					</select>
				</div>
				<div class="col-md-8">
					<input type="text" name="findKeyword" class="form-control"
						placeholder="검색어를 입력하세요">
				</div>
				<div class="col-md-2">
					<button type="button" onclick="check()" class="btn btn-warning">검색</button>
				</div>
			</div>
			<!--  row end -->
		</form>
		<!-- 검색 폼 끝---------------------- -->


		<table class="table table-condensed table-striped">
			<tr>
				<th>&nbsp;&nbsp;&nbsp; 글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>
			<!-- ---------------------------- -->
		<tbody>
			<c:forEach var="board" items="${list}">
					<tr>
						<td align="center">${board.boardNo}</td>
						<td align="left">${board.boardTitle}<input type="hidden" value="${board.boardNo}" /></td>
						<td align="left">${board.writer.nickname}</td>
						<td align="left">${board.viewCount}</td>
						<td align="left">${board.boardRegDate}</td>
					</tr>
				</c:forEach>
		</tbody>		
			<!-- ----------------------------- -->
			
			<tr>
				<td colspan="3" class="text-center">
					${navi}
				</td>
				<td colspan="2">총게시물수: <span class="text-danger"
					style="font-weight: bold">${page.totalCount}개</span> <br> <span
					class="text-danger" style="font-weight: bold">${page.pageUnit
					}</span>
					/${page.pageCount} pages
				</td>
			</tr>
		</table>
		
				<div align="right">
			<button type="button" class="btn btn-warning" style="width: 80px;"
				onclick="javascript:fncWrite('${writer.email}')">글쓰기</button>
		</div>
	</div>
</div>
</body>
</html>
