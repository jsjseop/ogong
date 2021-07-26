<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스터디 모집</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<link rel="stylesheet" href="/resources/css/boardStudy2.css">


<script>

let boardNo = "<c:out value='${board.boardNo}'/>";
let boardCategory = "<c:out value='${board.boardCategory}'/>";
let boardTitle = "<c:out value='${board.boardTitle}'/>";

let currentPage = 1;
let pageSize = 10;

function fncDeleteBoard() {

	if (confirm("삭제하시겠습니까?")) {

		location.href = "/board/deleteBoard?boardNo="+`${board.boardNo}`+"&boardCategory="+`${board.boardCategory}`; 
	}
}


function recommend() {
	var cnt = $('#cnt');
	$.ajax({
		url:'/board/updateRecommend',
		type:'post',
		data: {
			'boardNo': boardNo
		},
		dateType:'json',
		success:function(res){
			cnt.text(res);
		}
	});
}


function getCommentList(type) {
	if('M' === type){
		currentPage = currentPage+1; 
	}
	$.ajax({
		url:'/board/listComment',
		type:'get',
		data: {
			'boardNo': boardNo,
			'currentPage': currentPage,
			'pageSize': pageSize
		},
		dateType:'json',
		success:function(res){
			var list = res.list;
			var ul = $('#listComment');
			
			for(var i=0 ; i<list.length ; i++){
				var record = list[i];
				var li = $("<li>");

				var commentContents = $("<div class='commentContents'>");
				var commentRegDate = $("<div class='commentRegDate'>");
				var nickname = $("<div class='nickname'>");
				var commentNo = $("<input type='hidden' class='commentNo'>");
				var button = $("<button type='button' id='updatebtn' class='btn btn-primary'>수정</button>")
				commentContents.text(record.commentContents);
				commentRegDate.text(record.commentRegDate);
				nickname.text(record.nickname);

				commentContents.appendTo(li);
				commentRegDate.appendTo(li);
				nickname.appendTo(li);
				button.appendTo(li);
				
				li.appendTo(ul);
			}
		}
	});
}



function more() {
	getCommentList('M');
}

$(function() {
	getCommentList();
	
	
	$('button:contains("수 정")').on('click', function() {

		location.href = "/board/updateBoard?boardNo=" + boardNo;
	})

	$('button:contains("삭 제")').on('click', function() {

		fncDeleteBoard();
	})

	$('button:contains("목 록")').on('click', function() {

		location.href = "/board/listBoard?boardCategory=5";
		
	})
	
	$('button:contains("신 고")').on('click', function() {
		$("#myModalReport").find('#sendReporter').val($(this).find('input').val());
	})		
	
	$('#updatebtn').on('click', function() {

		updateComment();
	})
	
}) 


</script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap')
	;

body{
	padding:30px;
}

table, div, p, th, td, h1 {
	font-family: 'Do Hyeon', sans-serif; 
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
background-color: #FFDC3C;      
color: white;       
}  

</style>

</head>
<body>
	<jsp:include page="../common/toolbar.jsp" />
	<h1 class="con">게시글 상세</h1>
	<br/>
	<section class="article-detail table-common con row">
	
		<table class="cell" border="2">
			<tbody >
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
					<td colspan="3"><br/><br/><br/><br/><br/><br/>${board.boardContents}<br/><br/><br/><br/><br/><br/><br/></td>
				</tr>				
			</tbody>			
		</table>
	</section>
	<br/>
	

	<div align="center">
		<div id="recommend" class="btn btn-warning" onclick="recommend()"
			style="width: 60px;">
			추 천 <span id="cnt">0</span>
		</div>

		<%-- 			<c:if test="${user.userId == board.email || user.role == 'admin'}">
				<c:if test="${user.userId == board.email}"> --%>
	
		<button type="button" class="btn btn-danger" style="width: 60px;"
			data-toggle="modal" data-target="#myModalReport">신 고</button>

		<button type="button" class="btn btn-warning" style="width: 60px;">수 정</button>
		<%-- 				</c:if> --%>
		<button type="button" class="btn btn-warning" style="width: 60px;">삭 제 <input type="hidden" value="${message.sender.email}" />
		</button>
		<%-- 			</c:if> --%>
		<button type="button" class="btn btn-warning" style="width: 60px;">목 록</button>
	</div>


</body>
</html>