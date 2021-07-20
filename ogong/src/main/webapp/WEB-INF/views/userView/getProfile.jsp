<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

	<meta charset="EUC-KR"><!-- 1 -->
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /><!-- 2 -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" ><!-- 3 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" ><!-- 4 -->
	
	
	<link rel="stylesheet" type="text/css" href="../css/mainBack.css" >
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script><!-- 5 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script><!-- 6 -->
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet"><!-- 8 -->
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"><!-- 9 -->
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script><!-- 10 -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	<!-- 11 -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript"><!-- 12 -->
		
		//============= 회원정보수정 Event  처리 =============	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[name='구매']" ).on("click" , function() {
					alert("추후업데이트")	
				});
			
		});
		
		 $(function() {
		//	 $( "button[name='이전']" ).on("click" , function() {
			$( "button[name='이전']"  ).on("click" , function() {	 
				
				 self.location = "/product/listProduct?menu=search";
				});
		 });
	</script>
	
</head>
<body>
<form name="detailForm" method="post">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">스터디보기</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>프로필사진</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickname}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이름</strong></div>
			<div class="col-xs-8 col-md-4">${user.name}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${user.birth}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>목표와 각오</strong></div>
			<div class="col-xs-8 col-md-4">${user.goal}</div>
		</div>
		
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>관심사</strong></div>
			<div class="col-xs-8 col-md-4">${user.studyInterest1}</div>
			<div class="col-xs-8 col-md-4">${user.studyInterest2}</div>
			<div class="col-xs-8 col-md-4">${user.studyInterest3}</div>
			
		</div>
		
		<hr/>
		

		

		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
</form>
</body>

</html>