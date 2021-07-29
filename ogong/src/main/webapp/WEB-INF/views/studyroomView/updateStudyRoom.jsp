<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script> 
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');

body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
font-size: 15px;
}

/* textarea.form-control {
    height: auto;
    width: 40%;
}
.wrapper{
	margin-left:10px;
} */
.con
</style>
    

<script type="text/javascript">

$(function() {
	$( "button.btn.btn-info" ).on("click" , function() {
		fncUpdateStudy();
	});
	
	$("a[href='#' ]").on("click" , function() {
		history.go(-1);
	});
});		

function fncUpdateStudy() {
	$("form").attr("method","POST").attr("action","/studyroom/updateStudy").submit();
}
	</script>
	
</head>

<body>

	<jsp:include page="../layout/sidebar.jsp" />
	 <section id="main-content">
       <section class="wrapper">

		<div class="container">
			<div class="page-header text-center">
		       <h3 class=" text" align="left" style="margin-left:200px;">스터디룸 정보 수정</h3>
		    </div>
		    
		    <!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal" id="sroomfrom">
			<input type="hidden" name="studyNo" value="${study.studyNo}"/>
			  <div class="form-group" align="left">
			    <label for="studyName" class="col-sm-offset-1 col-sm-1 control-label">스 터 디 명</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="studyName" name="studyName" value="${study.studyName}" >
			    </div>
			  </div>
			
			  <div class="form-group">
			    <label for="groupStudyInfo" class="col-sm-offset-1 col-sm-1 control-label">스터디 소개</label>
			    <div class="col-sm-4">
			      <textarea class="form-control" id="groupStudyInfo" name="groupStudyInfo">${study.groupStudyInfo}</textarea>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="studyHashtag" class="col-sm-offset-1 col-sm-1 control-label">해 시 태 그</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="studyHashtag" name="studyHashtag" value="${study.studyHashtag}" >
			    </div>
			  </div>
			  
			  
			  <div class="form-group">
			    <label for="" class="col-sm-offset-1 col-sm-1 control-label">모집 기간</label>
			    <div class="col-sm-4">
			      <input type="text" size="27" value="${study.recruitmentStartDate} ~ ${study.recruitmentEndDate} " readonly>
			      <input type="hidden" name="recruitmentStartDate" value="${study.recruitmentStartDate}">
			      <input type="hidden" name="recruitmentEndDate"value="${study.recruitmentEndDate}">
			      <span id="helpBlock" class="help-block">
			      	<strong class="text-danger">수정불가</strong>
			      </span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="" class="col-sm-offset-1 col-sm-1 control-label">진행 기간</label>
			    <div class="col-sm-4">
			      <input type="text" size="27" value="${study.studyStartDate} ~ ${study.studyEndDate}" readonly>
			      <input type="hidden" name="studyStartDate" value="${study.studyStartDate}">
			      <input type="hidden" name="studyEndDate"value="${study.studyEndDate}">
			      
			      <span id="helpBlock" class="help-block" >
			      	<strong class="text-danger">수정불가</strong>
			      </span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2  col-sm-2 text-center">
			      <button type="button" class="btn btn-info"  >수 &nbsp;정</button>
				  <a class="btn btn-default btn" href="#" role="button">취 &nbsp;소</a>
			    </div>
			  </div>
			</form>
			<!-- form Start /////////////////////////////////////-->

	    
 	</div>

	<!--  화면구성 div Start /////////////////////////////////////-->
 		</section>
	</section>
</body>

</html>