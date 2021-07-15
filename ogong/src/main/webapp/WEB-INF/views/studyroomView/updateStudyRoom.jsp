<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateStudy();
			});
		});	
		
		
	
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				history.go(-1)
			});
		});	
		


		

		function fncUpdateStudy() {
			/* var studyName = $("input[name='studyName']").val();
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;

			 */
			$("form").attr("method","POST").attr("action","/studyroom/updateStudy").submit();
		}
	
	</script>
	
</head>

<body>

	<div class="container">
		
		<div class="page-header text-center">
	       <h3 class=" text-info">스터디룸 정보 수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="studyNo" value="${study.studyNo}"/>
		  <div class="form-group">
		    <label for="studyName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyName" name="studyName" value="${study.studyName}" >
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="groupStudyInfo" class="col-sm-offset-1 col-sm-3 control-label">스터디 소개</label>
		    <div class="col-sm-4">
		      <textarea class="form-control" id="groupStudyInfo" name="groupStudyInfo">${study.groupStudyInfo}</textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="studyHashtag" class="col-sm-offset-1 col-sm-3 control-label">해 시 태 그</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyHashtag" name="studyHashtag" value="${study.studyHashtag}" >
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="" class="col-sm-offset-1 col-sm-3 control-label">모집 기간</label>
		    <div class="col-sm-4">
		      <input type="text" value="${study.recruitmentStartDate} ~ ${study.recruitmentEndDate} " readonly>
		      <input type="hidden" name="recruitmentStartDate" value="${study.recruitmentStartDate}">
		      <input type="hidden" name="recruitmentEndDate"value="${study.recruitmentEndDate}">
		      <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">수정불가</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="" class="col-sm-offset-1 col-sm-3 control-label">진행 기간</label>
		    <div class="col-sm-4">
		      <input type="text" value="${study.studyStartDate} ~ ${study.studyEndDate}" readonly>
		      <input type="hidden" name="studyStartDate" value="${study.studyStartDate}">
		      <input type="hidden" name="studyEndDate"value="${study.studyEndDate}">
		      
		      <span id="helpBlock" class="help-block" >
		      	<strong class="text-danger">수정불가</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>