<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>게시판</title>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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
	
	$(function(){
		
		$("body #div3 #listComment").on("click", function(){
			$("#myModal3").find('#receiver2').val($(this).find('input').val());
		});

		$("ul2 li:nth-child(3)").on("click", function(){
			$("#myModalReport2").find('#receiveReporter').val($(this).find('input').val());
		});		
	
	})
	
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
				var li = "";
				var div = $('#commentContainer');
				var commentMore = $('<button type="buttonn" class="btn btn-danger" onclick="more()" style="margin-left:50px;" >더보기</button>');
				for(var i=0 ; i<list.length ; i++){
					var record = list[i];
					    li += "<li>"
							+ "<div class=>"+record.commentContents+"</div>"
							+ "<div class=>"+record.commentRegDate+"</div>"
							+ "<div class='dropdown'>"
 			  				+ "		<a id='dropdownMenu2' data-toggle='dropdown' aria-expanded='true'>"
 							+ 			record.nickname
							+ "		</a>"
							+ "		<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1' id='drop2'>"
							+ "			<li role='presentation'><a role='menuitem' tabindex='-1' href='#'>프로필보기</a></li>"
							+ "			<li role='presentation'><a role='menuitem' id='commentDrop' tabindex='-1' href='#' data-toggle='modal' data-target='#myModal3'>쪽지보내기"
							+ "				<input type='hidden' id='commentWriterEmail' value='"+record.commentWriter.email+"' /></a></li>"
							+ "			<li role='presentation'><a role='menuitem' tabindex='-1' href='#' data-toggle='modal' data-target='#myModalReport2'>신고하기"
							+ "				<input type='hidden' value='"+record.commentWriter.email+"' /></a></li>"
							+ "		</ul>"
							+ "</div>"
							+ "		<input type='hidden' class='commentNo'>"
							+ "<button type='button' onClick='updateModal(\""+record.commentNo+"\",\""+record.commentContents+"\")' class='btn-sm btn-primary'>수정</button>"
							+ "<button type='button' onClick='commentDelete("+record.commentNo+")' class='btn-sm btn-danger'>삭제</button>"
							+ "</li>";
				}
					$("#listComment").append(li);
				
			}
			
		});
	}
	
	function updateModal(commentNo, commentContents) {
		$('#commentNo').val(commentNo);
		$('#commentCts').text(commentContents);
		$('#modal').show();

	}
	
	function modalClose() {
		$('#modal').hide();
	}
	
	
	function updateComment(){
		var commentNo = $('#commentNo').val();
		var commentContents = $('#commentCts').val();
		$.ajax({
			url:'/board/updateComment',
			type:'POST',
			data: JSON.stringify({
				'boardNo': boardNo,
				'commentNo': commentNo,
				'commentContents': commentContents
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			dateType:'json',
			success:function(res){
				if (res) {
					$('#modal').hide();
					var ul = $('#listComment');
					ul.children('li').remove();
					
					getCommentList();
				} else{
					alert('실패');
				}
			}
		});
		
	}
	
	function commentDelete(commentNo) {
		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				url:'/board/deleteComment',
				type:'POST',
				data: JSON.stringify({
					'commentNo': commentNo,
					'boardNo': boardNo
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dateType:'json',
				success:function(res){
					if (res) {
						alert('삭제가 완료되었습니다.');
						var ul = $('#listComment');
						var div = $('#commentContainer');
						
						ul.children('li').remove();
						div.children('button').remove();
						getCommentList();
					} else{
						alert('다시 시도해주세요');
					}
				}
			});
			
		}
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
					var div = $('#commentContainer');
					ul.children('li').remove();
					div.children('button').remove();
					$('#comment').val("");
		
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
	
	function fileDown(fileNo){
		location.href = "/board/fileDown?fileNo=" + fileNo;	
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
		
	
		
		$('#updatebtn').on('click', function() {

			updateComment();
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

pre {
	border: 0;
	background-color: transparent;
}

td {
	text-align: left !important;
}

#modal {
	display: none;
	width: 400px;
	height: 365px;
	background-color: white;
	position: absolute;
	top: 350px;
	left: 40%;
	border: 1px solid #e9e9e9;
	z-index: 20;
}

pre:LINK, pre:VISITED {
	text-decoration: none;
	color: black;
}

pre:HOVER { /* 마우스 커서 올렸을때 */
	text-decoration: underline;
	color: #6E92A1;
	font-weight: bold;
}

pre:ACTIVE { /* 마우스 버튼을 눌렀을때 */
	text-decoration: none;
	color: black;
}
</style>
</head>

<body>
	<jsp:include page="../common/toolbar.jsp" />
	<jsp:include page="../adminView/addReport.jsp" />
	<jsp:include page="../adminView/addReport2.jsp" />
	<jsp:include page="../integrationView/addSendMessage2.jsp" />
	<jsp:include page="../integrationView/addSendMessage3.jsp" />

	<div class="container" id="div1">
		<div class="page-header">
		<br/>
			<h3 class=" text-default" style="text-align:center">상세보기</h3>
		</div>
		<br/>

		<input type="hidden" name="boardEmail" id="boardEmail" value="${board.writer.email}" />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>게시글 작성자</strong>
			</div>
			<div class="dropdown">
				<div class="col-xs-8 col-md-4"  id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					${board.writer.nickname}
				</div>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="drop1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">프로필보기</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#myModal2">쪽지보내기
					<input type="hidden" value="${board.writer.email}" /></a></li>
				</ul>
			</div>
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
				<a style="width: 450px; height: 120px;">${board.boardContents}</a>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>첨부파일</strong>
			</div>

			<div class="col-xs-6 col-md-4">
				<c:forEach var="file" items="${fileList}">
					<pre onClick="fileDown(${file.fileNo})" style="cursor: pointer; width: 250px; height: 80px; "cursor:pointer;">${file.fileName}</pre>
				</c:forEach>
			</div>
		</div>
		<hr />


		<div align="right">
			<div id="recommend" class="btn-sm btn-danger" onclick="recommend()" style="width: 60px;">
				추 천 <span id="cnt">0</span>
			</div>
		<div>
		</div>
		<br/>
			<%-- 			<c:if test="${user.userId == board.email || user.role == 'admin'}">
				<c:if test="${user.userId == board.email}"> --%>

			<button type="button" class="btn-sm btn-warning" style="width: 60px;" data-toggle="modal" data-target="#myModalReport">신 고</button>

			<button type="button" class="btn-sm btn-warning" style="width: 60px;">수 정</button>
			<%-- 				</c:if> --%>

			<button type="button" class="btn-sm btn-warning" style="width: 60px;">삭 제
				<input type="hidden" value="${message.sender.email}" />
			</button>
			<%-- 			</c:if> --%>
			<button type="button" class="btn-sm btn-warning" style="width: 60px;">목 록</button>
		</div>
	</div>

	<div class="container" id="div2">
		<div>
			<div>
				<span><strong>comment</strong></span> <span id="cnt"></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td><textarea style="width: 1100px" rows="3" cols="30"
								id="comment" placeholder="댓글을 입력하세요"></textarea> <br>
							<div>
								<a href='#' onClick="addComment()"
									class="btn pull-right btn-danger">등록</a>
							</div></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="container" id="div3">
		<ul id="listComment">
		</ul>
	</div>
	
	<div id="modal">
		<input type="hidden" id="commentNo">

		<textarea style="width: 500px" id="commentCts" rows="3" cols="30"
			placeholder="수정할 내용을 입력하세요"></textarea>
		<div>
			<button type="button" class="btn-sm btn-warning"
				onClick="updateComment()" style="width: 50px;">확인</button>
			<button type="button" class="btn-sm btn-warning"
				onClick="modalClose()" style="width: 50px;">취소</button>
		</div>
	</div>
</body>
</html>