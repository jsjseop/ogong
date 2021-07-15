<%@ page contentType="text/html; charset=EUC-KR" 
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="#">OGong</a>
		
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
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             

	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >자율스터디</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">자율스터디목록</a></li>
	                         <li><a href="#">모집게시판</a></li>
	                     </ul>
	               </li>
	               <li><a href="#">그룹스터디</a></li>
	               <li><a href="#">정보공유게시판</a></li>
	               <li><a href="#">Q&A게시판</a></li>
	               
	               <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >쉼터게시판</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">자유게시판</a></li>
	                         <li><a href="#">합격후기게시판</a></li>
	                     </ul>
	               </li>
	                 
	              <!-- 관리자기능 DrowDown  -->
	               <%-- <c:if test="${sessionScope.user.role == 'admin'}"> --%>
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >관리자</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li>
		                         	<a href="#">신고조회</a>
		                         </li>
		                         <li>
		                         	<a href="#">회원조회</a>
		                         </li>
		                     </ul>
		                </li>
	                 <%-- </c:if> --%>
	                 
	             </ul>
	             
	             <div class="collapse navbar-collapse" id="target">
	             	<ul class="nav navbar-nav navbar-right">
						<li class="dropdown-toggle" id="noticeCount"><a href="#"
							data-toggle="dropdown" role="button" aria-expanded="false"> 
							
							<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
						</a>
							<ul id="noticeList" class="dropdown-menu">
								<div align="right"><a href="javascript:deleteNoticeAll('user01')">전체삭제</a></div>
							</ul>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"> 
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								</span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">프로필</a></li>
								<li><a href="#">로그아웃</a></li>
								<li><a href="#">쪽지</a></li>
								<li><a href="#">공부기록</a></li>
								<li><a href="#">나의 스터디</a></li>
								<li><a href="#">나의 게시글</a></li>
								<li><a href="#">바나나 조회</a></li>
								<li><a href="#">회원 탈퇴</a></li>
							</ul>
						</li>						
													             		
	             	</ul>	             
	             </div>
	             
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">

	/* //============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 }); */
		
		//=============  자율스터디목록 Event  처리 =============
	 	$( "a:contains('자율스터디목록')" ).on("click" , function() {
	 		location.href = "/";
		});
		
	 	//=============  모집게시판 Event  처리 =============
	 	$( "a:contains('모집게시판')").on("click", function(){
	 		location.href = "/";
	 	});

	 	//=============  그룹스터디 Event  처리 =============
	 	$( "a:contains('그룹스터디')").on("click", function(){
	 		location.href = "/study/listStudy";
	 	});		 	
	 	
	 	//=============  정보공유게시판 Event  처리 =============
	 	$( "a:contains('정보공유게시판')").on("click", function(){
	 		location.href = "/;
	 	});	
	 	
	 	//=============  Q&A게시판 Event  처리 =============
	 	$( "a:contains('Q&A게시판')").on("click", function(){
	 		location.href = "listQaBoard";
	 	});	 	 	
		
	 	//=============  자유게시판 Event  처리 =============
	 	$( "a:contains('자유게시판')").on("click", function(){
	 		location.href = "listBoard";
	 	});
	 	
	 	//=============  합격후기게시판 Event  처리 =============
	 	$( "a:contains('합격후기게시판')").on("click", function(){
	 		location.href = "/";
	 	});	 

	 	//=============  신고조회 Event  처리 =============
	 	$( "a:contains('신고조회')").on("click", function(){
	 		location.href = "/admin/listUserReport";
	 	});	 	
	 	
	 	//=============  회원조회 Event  처리 =============
	 	$( "a:contains('회원조회')").on("click", function(){
	 		location.href = "/admin/listTotalUser";
	 	});	 
	 	
	 	//=============  프로필 Event  처리 =============
	 	$( "a:contains('프로필')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  로그아웃 Event  처리 =============
	 	$( "a:contains('로그아웃')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  쪽지 Event  처리 =============
	 	$( "a:contains('쪽지')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  공부기록 Event  처리 =============
	 	$( "a:contains('공부기록')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  나의 스터디 Event  처리 =============
	 	$( "a:contains('나의 스터디')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  나의 게시글 Event  처리 =============
	 	$( "a:contains('나의 게시글')").on("click", function(){
	 		location.href = "/";
	 	});	 
	 	
	 	//=============  바나나 조회 Event  처리 =============
	 	$( "a:contains('바나나 조회')").on("click", function(){
	 		location.href = "/";
	 	});
	 	
	 	//=============  회원탈퇴 Event  처리 =============
	 	$( "a:contains('회원탈퇴')").on("click", function(){
	 		location.href = "/";
	 	});	 	 	
	 	
	 	
	 	
	 	
	</script>  
	
	
	
	
	
	
	
	
	
	
	
	