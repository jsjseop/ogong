
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>글 쓰기</title>
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">



<script type="text/javascript">
	function fncAddBoard() {
		alert("asd");
		let name = $('input[name="boardTitle"]').val();
		let detail = $('textarea').val();

		if (name == null || name.length < 1) {
			alert("제목을 입력해주세요.");
			return;
		}
		if (detail == null || detail.length < 5) {
			alert("5글자 이상 입력해주세요.");
			return;
		}

		$('form').attr('method', 'POST').attr('action', '/board/addBoard')
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
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');
	body, table, div, p, th, td {
	
	
font-family: 'Do Hyeon', sans-serif;
}


h3 {

text-align:center;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

		<article>
	<br/>
		<div class="container" role="main">
		
			<h3>게시글 등록</h3>

			<form name="AddBoard" id="form" method="post" action="">

				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="boardTitle" id="title" placeholder="제목을 입력해 주세요"
					value="${boardTitle}">
					<input type="hidden" name="boardCategory" id="boardCategory" value="${boardCategory}"/>
				</div>				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="boardContents" id="content" placeholder="내용을 입력해 주세요" value="${boardTitle}"></textarea>

				</div>
			

			</form>

		</div>

<br/>
	</article>

			<div align="right">
				<button type="button" class="btn btn-default" style="width: 60px;">등 록</button>
				<button type="button" class="btn btn-default" style="width: 60px;">취 소</button>
			</div>
		</form>
	</div>
	<script>

	</script>	
</body>
</html>
