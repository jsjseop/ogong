<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>게시판</title>

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
<script>
	let boardNo = "<c:out value='${board.board.boardNo}'/>";

	function fncDeleteBoard() {

		if (confirm("삭제하시겠습니까?")) {

			location.href = "/board/deleteBoard?boardNo=" + boardNo;
		}
	}

	$(function() {

		$('button:contains("수 정")').on('click', function() {

			location.href = "/board/updateBoard?boardNo=" + boardNo;
		})

		$('button:contains("삭 제")').on('click', function() {

			fncDeleteBoard();
		})

		$('button:contains("목 록")').on('click', function() {

			location.href = "/board/listBoard";
		})
	})
</script>
<style>
body{
	padding-top: 30px;
}

pre {
	border: 0;
	background-color: transparent;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">
		<div class="page-header">
			<h3 class=" text-default">상세보기</h3>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>등록일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.board.boardRegDate}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>제 목</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.board.boardTitle}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>내 용</strong>
			</div>
			<div class="col-xs-8 col-md-4">
				<pre style="width: 450px; height: 150px;">${board.board.boardContents}</pre>
			</div>
		</div>

		<hr />

		<div align="right">
			<c:if test="${user.userId == board.userId || user.role == 'admin'}">
				<c:if test="${user.userId == board.userId}">
					<button type="button" class="btn btn-default" style="width: 60px;">수 정</button>
				</c:if>
				<button type="button" class="btn btn-default" style="width: 60px;">삭 제</button>
			</c:if>
			<button type="button" class="btn btn-default" style="width: 60px;">목 록</button>
		</div>
	</div>


<div class="container">
		<form id="commentForm" name="commentForm" method="post">
			<br> <br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="comment('${result.code }')"
										class="btn pull-right btn-success">등록</a>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id="b_code" name="b_code"
				value="${result.code }" />
		</form>
	</div>
	<div class="container">
		<form id="commentList" name="commentList" method="post">
			<div id="commentList"></div>
		</form>
	</div>
</body>
</html>