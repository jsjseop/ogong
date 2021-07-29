<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="Ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스터디 모집</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



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
	
table, div, p, th, td, h1 {
	font-family: 'Do Hyeon', sans-serif; 
	font-size: 15px;
}

h1.con {
	font-family: 'Do Hyeon', sans-serif; 
	font-size: 35px;
} 

table {
font-family: "Lato","sans-serif"; 
width: 1000px;
height: 380px;
margin :auto;  
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
	<jsp:include page="../integrationView/addSendMessage2.jsp" />
	<jsp:include page="../adminView/addReport.jsp" />
	<br/>
	<br/>
	<h1 class="con" style="text-align:center">스터디 모집 상세보기</h1>
	<br/>
	<section class="article-detail table-common con row">
		
		<input type="hidden" name="boardEmail" id="boardEmail" value="${board.writer.email}" />
		
		<table class="cell" border="2">
			<tbody >
				<tr class="article-title">
					<th>제목:</th>
					<td colspan="3">${board.boardTitle}</td>
					<th>작성자</th>
					<td colspan="3">
						<div class="dropdown">
							<a id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								${board.writer.nickname}
							</a>
							  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">프로필보기</a></li>
							    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModal2">쪽지보내기
							    <input type="hidden" value="${board.writer.email}" /></a></li>
							  </ul>									
						</div>
					</td>
				</tr>
				<tr class="article-info">
					<th>등록일자</th>
					<td colspan="3">${board.boardRegDate}</td>
					<th>조회수</th>
					<td colspan="3">${board.viewCount}</td>
				</tr>
				<tr class="article-date">
					<th>스터디 모집일자</th>
					<td colspan="10">${board.studyStartDate} ~ ${board.studyEndDate}</td>
				</tr>
				<tr class="article-body">
					<th>내용</th>
					<td colspan="10">
					<br/><br/><br/><br/><br/><br/>${board.boardContents}<br/><br/><br/><br/><br/><br/><br/></td>
				</tr>				
			</tbody>			
		</table>
	</section>
	<br/>
	

	<div align="center">
		<div id="recommend" class="" onclick="recommend()"
			style="width: 60px;">
			<span id="cnt"></span>
		</div>

		<%-- 			<c:if test="${user.userId == board.email || user.role == 'admin'}">
				<c:if test="${user.userId == board.email}"> --%>
	
		<button type="button" class="btn btn-danger" style="width: 60px;" data-toggle="modal" data-target="#myModalReport">신 고</button>

		<button type="button" class="btn btn-warning" style="width: 60px;">수 정</button>
		<%-- 				</c:if> --%>
		<button type="button" class="btn btn-warning" style="width: 60px;">삭 제 <input type="hidden" value="${message.sender.email}" />
		</button>
		<%-- 			</c:if> --%>
		<button type="button" class="btn btn-warning" style="width: 60px;">목 록</button>
	</div>

<br/>

</body>
</html>