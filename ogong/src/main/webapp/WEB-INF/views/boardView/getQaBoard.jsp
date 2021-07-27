<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Q&A 게시판 보기</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>



<script>
	let boardNo = "<c:out value='${board.boardNo}'/>";
	let boardCategory = "<c:out value='${board.boardCategory}'/>";
	let boardTitle = "<c:out value='${board.boardTitle}'/>";
	
	let currentPage = 1;
	let pageSize = 10;
	
	function fncDeleteBoard() {

		if (confirm("삭제 하시겠습니까?")) {

			location.href = "/board/deleteBoard?boardNo="+`${board.boardNo}`+"&boardCategory="+`${board.boardCategory}`; 
		}
	}

	
	function getAnswerList() {
		var cnt = $('#cnt');
		$.ajax({
			url:"/board/listAnswer/"+boardNo,
			type:'get',	
			dateType:'json',
			success:function(res){
				var list = res;
				var ul = $('#listAnswer');

				for(var i=0 ; i<list.length ; i++){
					var record = list[i];
					var div = $("<div>");

					var title = $("<div class='boardTitle'>");
					var answerContents = $("<div class='answerContents'>");
					var answerDate = $("<div class='answerDate'>");
					var nickname = $("<div class='nickname'>");
					var button = $("<a id='modal-872384' href='#modal-container-872384' role='button'"
							+"class='btn' data-toggle='modal'>채택</a>");
					
					title.text(boardTitle);
					answerContents.text(record.answerContents);
					answerDate.text(record.answerRegDate);
					nickname.text(record.answerWriter.nickname);
				
					title.appendTo(div);
					answerContents.appendTo(div);
					answerDate.appendTo(div);
					nickname.appendTo(div);
					
					div.appendTo(ul);
					
					ul.append()
				}
			}
		});
	}

	
	$(function() {
		getAnswerList();
		
		$('button:contains("답변등록")').on('click', function() {

			location.href = "/board/addAnswer?boardNo=" + boardNo;
		})
		
		$('button:contains("수 정")').on('click', function() {

			location.href = "/board/updateBoard?boardNo=" + boardNo;
		})

		$('button:contains("삭 제")').on('click', function() {

			fncDeleteBoard();
		})

		$('button:contains("목 록")').on('click', function() {

			location.href = "/board/listBoard?boardCategory=" + boardCategory;
		})
	})
	
	
</script>
<style>

@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
}

@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body{
	padding:30px;
}

table {
font-family: "Lato","sans-serif";   
}


td {                         
text-align: center;     
width: 10em;                    
padding: 1em;   
} 


th {                             
text-align: center;                 
padding: 1em;
background-color: #7F7F7F;      
color: white;
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />

	<h1 class="con">Q&A 게시글 상세</h1>
	<br />
	<section class="article-detail table-common con row">

		<table class="cell" border="2">
			<tbody>
				<tr class="article-title">
					<th>제목:</th>
					<td colspan="4">${board.boardTitle}</td>
					<th>작성자</th>
					<td colspan="4">${board.writer.email}</td>
				</tr>
				<tr class="article-info">
					<th>등록일자</th>
					<td colspan="4">${board.boardRegDate}</td>
					<th>조회수</th>
					<td colspan="4">${board.viewCount}</td>
				</tr>
				<tr class="article-body">
					<th>내용</th>
					<td colspan="3"><br />
					<br />
					<br />
					<br />
					<br />
					<br />${board.boardContents}<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br /></td>
				</tr>
			</tbody>
		</table>
	</section>
	<br />


	<div align="center">

		<button type="button" class="btn btn-success" style="width: 80px;">답변등록</button>

		<c:if test="${user.email == board.writer.email}">
			<button type="button" class="btn btn-warning" style="width: 60px;">수정</button>
			<button type="button" class="btn btn-warning" style="width: 60px;">삭제</button>
		</c:if>
		<button type="button" class="btn btn-warning" style="width: 60px;">목록</button>
		<button type="button" class="btn btn-danger" style="width: 60px;">신고</button>
	</div>

	<div class="answer-header">
		<h2>${board.answerCount}개의 답변이 달렸습니다.</h2>
	</div>
	<ul id="listAnswer">

	</ul>
	<div class="modal fade" id="modal-container-872384" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">채택확인 여부</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">이 글을 채택하시겠습니까?</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary">네</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>


	</div>

	</div>
	</div>

</body>
</html>