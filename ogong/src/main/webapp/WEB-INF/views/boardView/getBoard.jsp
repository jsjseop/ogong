<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>게시판</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 -->
 <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
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

<!-- css, JS -->
<script type="text/javascript" src="resources/css/fileUpload.css"></script>
<script type="text/javascript" src="resources/javascript/fileUpload.js"></script>



<script>
    let boardNo = "<c:out value='${board.boardNo}'/>";
	let boardCategory = "<c:out value='${board.boardCategory}'/>";
	
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
	
	function addComment() {
		var commentContents = $('#comment').val();
		currentPage = 1; 
		$.ajax({
			url:'/board/addComment',
			type:'post',
			data: JSON.stringify({
				'boardNo': boardNo,
				'commentContents': commentContents
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			dateType:'json',
			success:function(res){
				if (res) {
					var ul = $('#listComment');
					ul.children('li').remove();
					$('#comment').val("");
					
					getCommentList();
				} else{
					alert('실패');
				}
			}
		});
	}
	
	
	function updateComment() {
		var commentContents = $('#comment').val();
		var commentNo = $('.commentNo').val();
		currentPage = 1; 
		$.ajax({
			url:'/board/updateComment',
			type:'POST',
			data: {
				commentNo: commentNo,
				commentContents: commentContents
			},
			dateType:'json',
			success:function(res){
				if (res) {
					var ul = $('#listComment');
					ul.children('li').remove();
					
					getCommentList();
				} else{
					alert('실패');
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

			location.href = "/board/listBoard?boardCategory=" + boardCategory;
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
	<jsp:include page="../adminView/addReport.jsp" /> 

	<div class="container">
		<div class="page-header">
			<h3 class=" text-default">상세보기</h3>
		</div>
		
		<input type="hidden" name="boardEmail" id="boardEmail" value="${board.writer.email}" />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>게시글 작성자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.writer.nickname}</div>
		</div>
		<hr />		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>등록일자</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.boardRegDate}</div>
		</div>

		<hr />
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>조회수</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.viewCount}</div>
		</div>

		<hr />
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>제 목</strong>
			</div>
			<div class="col-xs-8 col-md-4">${board.boardTitle}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>내 용</strong>
			</div>
			<div class="col-xs-6 col-md-4">
				<pre style="width: 450px; height: 150px;">${board.boardContents}</pre>
			</div>
		</div>

		<hr />
		


		<div align="right">
			<div id="recommend" class="btn btn-danger" onclick="recommend()" style="width: 60px;">추 천 <span id="cnt">0</span></div>
			
<%-- 			<c:if test="${user.userId == board.email || user.role == 'admin'}">
				<c:if test="${user.userId == board.email}"> --%>
				
						<button type="button" class="btn btn-warning" style="width: 60px;" data-toggle="modal" data-target="#myModalReport">신 고</button>
						
					<button type="button" class="btn btn-warning" style="width: 60px;">수 정</button>
<%-- 				</c:if> --%>
				<button type="button" class="btn btn-warning" style="width: 60px;">삭 제
					<input type="hidden" value="${message.sender.email}" />
				</button>
<%-- 			</c:if> --%>
			<button type="button" class="btn btn-warning" style="width: 60px;">목 록</button>
		</div>
	</div>

<div class="container">
			<div>
				<div>
					<span><strong>comment</strong></span> <span id="cnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="comment" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="addComment()"
										class="btn pull-right btn-danger">등록</a>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-4 col-md-2">
			<strong>제 목</strong>
		</div>
		<div class="col-xs-8 col-md-4">${board.boardTitle}</div>
	</div>
	<ul id="listComment">
	

	</ul>
</div>
	
	
	<button type="button" class="btn btn-danger" onclick="more()" style="width: 60px;">더보기</button>
</body>
</html>