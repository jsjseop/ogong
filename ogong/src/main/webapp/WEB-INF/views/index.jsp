<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" > -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="../css/mainBack.css" >
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("#btn11").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/loginView"
			});
		});
		
	</script>	
	
	
	
</head>

<body >
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Ogong</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
	       
	       
	       <div id="myCarousel" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			    <li data-target="#myCarousel" data-slide-to="1"></li>
			    <li data-target="#myCarousel" data-slide-to="2"></li>
			    <li data-target="#myCarousel" data-slide-to="3"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img class="center-block" src="https://mblogthumb-phinf.pstatic.net/20160616_252/jjogabriel_1466057928503jUuvo_PNG/%B1%CD%BF%A9%BF%EE_%B0%ED%BE%E7%C0%CC_%C3%CA%B0%ED%C8%AD%C1%FA_%B9%D9%C5%C1%C8%AD%B8%E9%C0%CC%B9%CC%C1%F6_%2813%29.png?type=w2" alt="Chania">
			    </div>
			
			    <div class="item">
			      <img class="center-block" "img-responsive center-block" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbIuSj0%2FbtqwD3Ts9Z0%2F277y9vZYsIKszxWtCwjO11%2Fimg.png" alt="Chania">
			    </div>
			
			    <div class="item">
			      <img class="center-block" src="https://t1.daumcdn.net/cfile/tistory/9951754A5DFD9A1F05" alt="Flower">
			    </div>
			
			    <div class="item">
			      <img class="center-block" src="https://e7.pngegg.com/pngimages/291/943/png-clipart-labrador-retriever-desktop-puppy-high-definition-television-puppy-animals-carnivoran.png" alt="Flower">
			    </div>
			  </div>
			
			  <!-- Left and right controls -->
			  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>나폴레옹은 이렇게 말했다.</h2>
		 <p>배고프다고</p>
        </div> 
        <div class="col-md-4">
          <h2>강사님은 말했다.</h2>
          <p>돌아간다 신난다.</p>
       </div> 
        <div class="col-md-4">
          <h2>OGong이란</h2>
          <p>오늘의 공부의 줄임말로 온라인 스터디를 중심으로 한 웹 사이트이다.</p>
        </div>
      </div>
    </div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		

		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>
