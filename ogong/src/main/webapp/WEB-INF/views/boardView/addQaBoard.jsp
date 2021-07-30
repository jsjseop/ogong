<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>글 쓰기</title>

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">


	
</script>

<script type="text/javascript">
	function fncAddBoard() {

		let contents = $('input[name="boardContents"]').val();	
		let name = $('input[name="boardTitle"]').val();
		let detail = $('textarea').val();
		let boardRegBanana = $("input[name='boardRegBanana']").val();
		
		alert(boardRegBanana);
		
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

@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');

body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}


h3 {

text-align:center;
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
		<article>
	<br/>
		<div class="container" role="main">
		
			<h3>Q&A 게시글 등록</h3>

			<form name="AddBoard" id="form" method="post">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="boardTitle" id="title" placeholder="제목을 입력해 주세요"
					value="${boardTitle}">

				</div>
				
				<div class="mb-3">

					<label for="banana">바나나 수</label>

				<input type="text" class="form-control" name="boardRegBanana" id="banana" placeholder="채택에 필요한 바나나 수를 입력해주세요"
				value="${boardRegBanana}">

				</div>			

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="boardContent" id="content" placeholder="내용을 입력해 주세요" value="${boardTitle}"></textarea>

				</div>
			

			</form>

		</div>

<br/>
	</article>


			<div align="center">
				<button type="button" class="btn btn-warning" style="width: 60px;">등 록</button>
				<button type="button" class="btn btn-warning" style="width: 60px;">취 소</button>
			</div>
		</div>
	
</body>
</html>
