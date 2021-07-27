<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>파일공유 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	$(function() {

		$("#addForm").submit(function(e) {
			e.preventDefault();
			var formData = new FormData($(this)[0]);
			$.ajax({
				url : 'board/json/addBoard',
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

</head>
<body>

	<div class="container">
		<h2>파일업로드</h2>
		<form id="addForm">
			<input id="input_file" multiple="multiple" type="file"
				name="file">
			<input type="hidden" name="boardCategory" value="${boardCategory}">
			<input type="text" name="boardTitle" value="제목을 입력해주세요">
			<input type="text" name="boardContents" value="내용을 입력해주세요">
			<input type="hidden" name="boardInterest" value=""> 	 
			<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
		</form>
	</div>
</body>
</html>