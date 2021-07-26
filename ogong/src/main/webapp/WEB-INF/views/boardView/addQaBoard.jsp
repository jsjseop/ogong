<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>글 쓰기</title>

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
<script type="text/javascript" src="../javascript/calendar.js">
	
</script>

<script type="text/javascript">
	function fncAddBoard() {

		let name = $('input[name="boardTitle"]').val();
		let detail = $('textarea').val();

		if (name == null || name.length < 1) {
			alert("제목을 입력해주세요.");
			return;
		}

		$('form').attr('method', 'POST').attr('action', "/board/addBoard?boardCategory="+`${boardCategory}`)
				.submit();
	}

	$(function() {

		$('button:contains("등 록")').on('click', function() {
			
			fncAddBoard();
		});

		$('button:contains("취 소")').on('click', function() {

			$('form')[0].reset();
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
		<form>
			<input type="hidden" name="userId" value="${writer.email}" />

			<div class="page-header">
				<h3 class=" text-default">Q&A 게시글 등록</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>제 목</strong>
					
				</div>
				<div class="col-xs-8 col-md-4">
					<input class="form-control" type="text" name="boardTitle" value="${boardTitle}"
						style="width: 500px;" />
	
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-2 col-md-2">
					<strong>내  용</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input class="form-control" type="text" name="answerContents"
						style="width: 500px; height:300px;" />
				</div>
			</div>

			<hr />
			
			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>바나나 개수 선택</strong>
				</div>	
						<select name="banana">
			
							  <option value="1" selected="selected">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
							  <option value="2">4</option>
							  <option value="3">5</option>
							  <option value="2">6</option>
							  <option value="3">7</option>
							  <option value="2">8</option>
							  <option value="3">9</option>
							  <option value="3">10</option>
							  
					</select>
				</div>
				<div class="col-xs-8 col-md-4">
			</div>	


			<div align="left">
				<button type="button" class="btn btn-default" style="width: 60px;">등 록</button>
				&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp 
				<button type="button" class="btn btn-default" style="width: 60px;">취 소</button>
			</div>
		</form>
	</div>
	
</body>
</html>
