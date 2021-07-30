<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>스터디 목록</title>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" >

<script type="text/javascript">

	

	function fncGetList() {
		$('form').attr('action', '/selfStudy/listStudy?studyType=${studyType}')
				.attr('method', 'POST').submit();
	}
	
	function getStudyList(page) {
		$.ajax({
			type : 'post',
			url : "/selfStudy/json/listStudy",
			data : JSON.stringify({currentPage: page,
									searchKeyword: $("#searchKeyword").val(),
									studyType: "${studyType}",
									studyInterest: $("#studyInterest").val(),
									searchSort: $('#searchSort').val() }),
			dataType: "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(result) {				
				var list = result.list;
				$("#totalCount").html("전체 "+result.totalCount+"개의 스터디");
				
				var addListHtml ="";
				if(list.length > 0) {
					$.each(list, function(index, study){
						
						addListHtml += '<div class="col-xs-12 col-md-3">';
						addListHtml += '<a class="thumbnail">';
						addListHtml += '<img src="/resources/upload_files/study/green.jpg" alt="None"></a>';
						addListHtml += '<input type="hidden" value="'+study.studyNo+'">';
						addListHtml += '<p class="text-center">'+study.studyName+' &nbsp;&nbsp;&nbsp;';
						addListHtml += study.currentMember+'/'+study.maxMember+'</p>';
						addListHtml += '<p class="text-center">'+study.studyHashtag+'</p>';
						addListHtml += '<p class="text-center">'+study.studyStartDate+'~'+study.studyEndDate+'</p>';
						addListHtml += '</div>';
							
					});
					$("#list").append(addListHtml);
				}
			},
			error:function(request, status, error){
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

	$(function() {

		$('img').on('click',function() {
					let studyNo = $(this).parent().parent().children('input').val();
					alert(studyNo);
					location.href = "/selfStudy/getStudy?studyNo=" + studyNo
							+ "&studyType=" + `${studyType}`;
				});

		$('button:contains("검색")').on('click', function() {

			fncGetList();
		});
		
		$("#searchKeyword").keydown(function(key) {

			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				fncGetList();
			}
		});
		
		$('#searchSort').on('change', function(){
			$('#list').empty();
			page = 1;
			getStudyList(page);
		})
		
		$('#studyInterest').on('change', function(){
			$('#list').empty();
			page = 1;
			getStudyList(page);
		})
		
	})
	
	var page = 1;
	$(window).scroll(function() {
		  if(((window.innerHeight + window.scrollY) >= document.body.offsetHeight)){
		      console.log(++page);
		      
		      getStudyList(page);
		  }
	});
</script>
<style>
body {
	padding-top: 30px;
}

.row {
	margin: 80px 0px 80px 0px;
}

img {
	-webkit-transform: scale(1, 1);
	-ms-transform: scale(1, 1);
	transform: scale(1, 1);
	transition-duration: 0.3s;
}

img:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
	transition-duration: 0.3s;
	box-shadow: 10px 10px 5px #888888;
	z-index: 1;
}
</style>
</head>

<body>

	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-center">
			<c:if test="${studyType == 'self'}">
				<h3>자율 스터디</h3>
			</c:if>
			<c:if test="${studyType == 'group'}">
				<h3>그룹 스터디</h3>
			</c:if>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default" id="totalCount">전체 ${totalCount} 개의 스터디</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">
					<div class="form-group">
						<select class="form-control" id="studyInterest" name="studyInterest" data-width="120px">
							<option value="0">전체</option>
							<option value="1"
								${! empty search.studyInterest && search.studyInterest== 1 ? "selected" : ""  }>독서</option>
							<option value="2"
								${! empty search.studyInterest && search.studyInterest== 2 ? "selected" : ""  }>어학</option>
							<option value="3"
								${! empty search.studyInterest && search.studyInterest== 3 ? "selected" : ""  }>임용</option>
							<option value="4"
								${! empty search.studyInterest && search.studyInterest== 4 ? "selected" : ""  }>취업</option>
							<option value="5"
								${! empty search.studyInterest && search.studyInterest== 5 ? "selected" : ""  }>공무원</option>
							<option value="6"
								${! empty search.studyInterest && search.studyInterest== 6 ? "selected" : ""  }>자격증</option>
							<option value="7"
								${! empty search.studyInterest && search.studyInterest== 7 ? "selected" : ""  }>자기계발</option>
							<option value="8"
								${! empty search.studyInterest && search.studyInterest== 8 ? "selected" : ""  }>기타공부</option>
						</select>
					</div>
					
					<div class="form-group">
						<select class="form-control" id="searchSort" name="searchSort" data-width="120px">
							<option value="0"
								${! empty search.searchSort && search.searchSort== 0 ? "selected" : ""  }>최신순</option>
							<option value="1"
								${! empty search.searchSort && search.searchSort== 1 ? "selected" : ""  }>오래된순</option>
							<option value="2"
								${! empty search.searchSort && search.searchSort== 2 ? "selected" : ""  }>인원많은순</option>
							<option value="3"
								${! empty search.searchSort && search.searchSort== 3 ? "selected" : ""  }>인원적은순</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

					<input type="hidden" id="currentPage" name="currentPage" value="1" />
				</form>
			</div>
			<br />
			<hr />
		</div>
		<div class="row" id="list">
			<c:forEach var="study" items="${list}">
				<div class="col-xs-12 col-md-3">
					<a class="thumbnail"> <img
						src="/resources/upload_files/study/green.jpg" alt="None">
					</a> <input type="hidden" value="${study.studyNo}">
					<p class="text-center">${study.studyName}&nbsp;&nbsp;&nbsp;
						${study.currentMember}/${study.maxMember}</p>
					<p class="text-center">${study.studyHashtag}</p>
					<p class="text-center">${study.studyStartDate}~
						${study.studyEndDate}</p>
				</div>
			</c:forEach>
		</div>



	</div>
	<!--  table End /////////////////////////////////////-->
</body>
</html>
