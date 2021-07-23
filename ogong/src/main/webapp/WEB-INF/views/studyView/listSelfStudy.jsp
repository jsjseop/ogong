<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>스터디 목록</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript">
   function fncGetList(currentPage) {
      $('#currentPage').val(currentPage);
      $('form').attr('action','/selfStudy/listStudy?studyType=${studyType}').attr('method','POST').submit();
   }

   $(function() {
	   
	  $('img').on('click', function() {
	      let studyNo = $(this).parent().parent().children('input').val();
	      alert(studyNo);
	      location.href = "/selfStudy/getStudy?studyNo="+studyNo+"&studyType="+`${studyType}`;
	  })
      
      $('button:contains("검색")').on('click', function(){
         
         fncGetList('1');
      })
      
   })
   
   $(function(){
         
          $("#searchKeyword").keydown(function (key) {
          
              if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                 fncGetList('1');
              }
          });
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
	-webkit-transform: scale(1.5, 1.5);
    -ms-transform: scale(1.5, 1.5);
    transform: scale(1.5, 1.5);
    transition-duration: 0.3s;
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
</style>
</head>

<body>

	<jsp:include page="../common/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-default">
			<c:if test="${studyType == 'self'}">
				<h3>자율 스터디 목록</h3>
			</c:if>
			<c:if test="${studyType == 'group'}">
				<h3>그룹 스터디 목록</h3>
			</c:if>
		</div>

		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-default">전체 ${totalCount} 건수, 현재 ${currentPage}
					페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select name="searchCondition" class="form-control"
							style="width: 110px">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition== 0 ? "selected" : ""  }>제목+내용</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition== 1 ? "selected" : ""  }>제목</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition== 2 ? "selected" : ""  }>작성자</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

					<input type="hidden" id="currentPage" name="currentPage" value="" />
				</form>
			</div><br/><hr/>

			<c:forEach var="study" items="${list}">
				<div class="col-xs-6 col-md-3">
					<a class="thumbnail"> <img
						src="/resources/upload_files/study/green.jpg" alt="None">
					</a>
					<input type="hidden" value="${study.studyNo}">
					<p class="text-center">${study.studyName} &nbsp;&nbsp;&nbsp;
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