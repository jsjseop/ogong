<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OGong</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');

body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}
</style>
<script type="text/javascript">
	$( function(){
		$("#entrance").on("click", function(){
			
			$.ajax({
    			url: "/selfStudy/entranceStudy/"+`${study.studyNo}`,
    			method : "GET" ,
    			dataType : "text",
    			success: function (data, status){
    				if(data == "success"){
    					popWin = window.open("https://wnstjqtest.herokuapp.com/"+`${study.studyNo}`+"/"+`${user.email}`,
        						"CamStudy",
        						"height=" + screen.height + ",width=" + screen.width + "fullscreen=yes");
    				}else{
    					alert("이미 참여중입니다.");
    				}
    			}
    		});			
			
		});
	});
</script>
</head>
<body>

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">자율스터디 입장</h3>
	    </div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>스 터 디 명</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>해 시 태 그</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyHashtag}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>현재 인원</strong></div>
			<div class="col-xs-8 col-md-4">${study.currentMember} / ${study.maxMember}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>규칙 및 공지사항</strong></div>
			<div class="col-xs-8 col-md-4">${study.selfStudyRule}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>썸 네 일</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyThumbnail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
					<button id="entrance" >입장하기</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>

</body>
</html>