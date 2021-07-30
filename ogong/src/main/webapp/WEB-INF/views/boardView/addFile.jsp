<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>파일공유 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery -->

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">



<script>
	$(function() {

		$("#addForm").submit(function(e) {
			e.preventDefault();
			var formData = new FormData($(this)[0]);
			$.ajax({
				url : '/board/json/addBoard',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(res) {
					location.href = "/board/getBoard?boardNo=" + res;
				}
			});
			return false;
		});
	});
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;


body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>

	<jsp:include page="../common/toolbar.jsp" />
</head>

<body>


	<div class="container">

<br/>
		<h3>게시글 등록</h3>




		<form id="addForm">


			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="boardTitle" id="title"
					placeholder="제목을 입력해 주세요">

			</div>

			<div class="mb-3">

				<label for="content">내용</label>

				<textarea class="form-control" rows="5" name="boardContents"
					id="content" placeholder="내용을 입력해 주세요"></textarea>

			</div>

			<h2>파일업로드</h2>

			<input id="input_file" multiple="multiple" type="file" name="file">
			<input type="hidden" name="boardCategory" value="${boardCategory}">
			<!-- 			<input type="text" name="boardTitle" value="제목을 입력해주세요">
			<input type="text" name="boardContents" value="내용을 입력해주세요">
			<input type="hidden" name="boardInterest" value=""> 	  -->
			<!-- <button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button> -->

			<div align="center">
				<br />
				<button type="submit" style="width: 80px"
					class="btn btn-xl btn-warning" id="btnAdd">등록</button>

				<button type="button" style="width: 80px"
					class="btn btn-xl btn-warning" id="btnList">목록</button>

			</div>

		</form>
	</div>


</body>
</html>