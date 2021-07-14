<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript">

	$(function(){
		$ ( "#btn1").on("click", function(){
			fncAddStudy();
		});
	});
	
	function fncAddStudy() {
		$("form").attr("method","POST").attr("action","/study/addStudy").submit();
	}
	

	$( function() {
		$('#sdate, #sdate1').datepicker();
		
		$('#sdate').datepicker("option", "maxDate", $("#edate").val());
		
		$('#sdate1').datepicker("option", "maxDate", $("#edate1").val());
		
		$('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#edate").datepicker( "option", "minDate", selectedDate );
		});
		
		$('#sdate1').datepicker("option", "onClose", function ( selectedDate ) {
			$("#edate1").datepicker( "option", "minDate", selectedDate );
		});

		$('#edate, #edate1').datepicker();
		
		$('#edate').datepicker("option", "minDate", $("#sdate").val());
		
		$('#edate1').datepicker("option", "minDate", $("#sdate1").val());
		
		$('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate").datepicker( "option", "maxDate", selectedDate );
		});
		
		$('#edate1').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate1").datepicker( "option", "maxDate", selectedDate );
		});
		
		
	
	});

	$.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        changeMonth: true,
	        changeYear: true,
	        yearRange: 'c-99:c+99',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
</script>

</head>
<body>
	<div class="container">
	
		<h1 class="bg-info text-center">스터디 개설</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <input type="hidden" name="currentMember"	value="1"/>
		  <input type="hidden" name="maxMember"	value="5"/>
		  <input type="hidden" name="email"	value="user07"/>
		  <input type="hidden" name="studyRole" value="3"/>
		
		  <div class="form-group">
		    <label for="studyName" class="col-sm-offset-1 col-sm-3 control-label">스 터 디 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyName" name="studyName" placeholder="스 터 디 명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="groupStudyInfo" class="col-sm-offset-1 col-sm-3 control-label">스터디 소개</label>
		    <div class="col-sm-4">
		    <textarea style="height:100px; resize:none;" class="form-control" id="groupStudyInfo" name="groupStudyInfo" placeholder="스터디 소개"></textarea>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="studyRoomGrade" class="col-sm-offset-1 col-sm-3 control-label">스터디 방 등급</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyRoomGrade" name="studyRoomGrade" placeholder="스터디 방 등급">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="studyType" class="col-sm-offset-1 col-sm-3 control-label">self/group 선택</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyType" name="studyType" placeholder="스터디 종류">
		    </div>
		  </div>
		  

		  <div class="form-group">
		    <label for="studyHashtag" class="col-sm-offset-1 col-sm-3 control-label">해 시 태 그</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyHashtag" name="studyHashtag" placeholder="해 시 태 그">
		    </div>
		  </div>
		  
		  <!-- <div class="form-group">
		    <label for="current" class="col-sm-offset-1 col-sm-3 control-label">인 원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studyName" name="studyName" placeholder="인 원">
		    </div>
		  </div> -->
		 
		  
		  <div class="form-group">
		  	<label for="studyHashtag" class="col-sm-offset-1 col-sm-3 control-label">모집 기간</label>
		    <span class="col-sm-4">
		      <input type="text" class="form-control" id="sdate" name="recruitmentStartDate" placeholder="모집 시작일자">
		       <input type="text" class="form-control" id="edate" name="recruitmentEndDate" placeholder="모집 종료일자">
		    </span>
		  </div>
		  
		 <div class="form-group">
		 	<label for="studyHashtag" class="col-sm-offset-1 col-sm-3 control-label">진행 기간</label>
		    <span class="col-sm-4">
		      <input type="text" class="form-control" id="sdate1" name="studyStartDate" placeholder="스터디 시작일자">
		      <input type="text" class="form-control" id="edate1" name="studyEndDate" placeholder="스터디 종료일자">
		    </span>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="studyThumbnail" class="col-sm-offset-1 col-sm-3 control-label">썸 네 일</label>
		    <div class="col-xs-3">
		      <input type="text" id="studyThumbnail" name="studyThumbnail">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="studyInterest" class="col-sm-offset-1 col-sm-3 control-label">관 심 사</label>
		    <div class="col-xs-3">
		      <input type="text" id="studyInterest" name="studyInterest">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >등 &nbsp;록</button>
			  <a class="btn btn-info btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>