<%@ page contentType="text/html; charset=EUC-KR" 
	pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    	<!-- Custom styles for this template-->

<!-- ToolBar Start /////////////////////////////////////-->
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
			.Ogong {
			  width: 120px;
			  height: 50px;
			}
  </style>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  
  
  <!-- Font Awesome Icons ==================-->
  <link rel="stylesheet" href="/resources/css/all.min.css">
  <!-- Font Awesome Icons END ==================-얘가 안돼 ㅠㅠㅠㅠ ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ->
  
  
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/css/adminlte.min.css">
</head>
<body class="hold-transition layout-top-nav">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
    <div class="container">
      <a href="../../index3.html" class="navbar-brand">
        <img src="/resources/images/Ogong.png" class="Ogong" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      </a>

      <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse order-3" id="navbarCollapse">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">자율스터디</a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
              <li><a href="#" class="dropdown-item">자율스터디목록</a></li>
              <li><a href="#" class="dropdown-item">모집게시판</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="index3.html" class="nav-link">그룹스터디</a>
          </li>
          <li class="nav-item">
            <a href="index3.html" class="nav-link">정보공유게시판</a>
          </li>
          <li class="nav-item">
            <a href="index3.html" class="nav-link">Q&A게시판</a>
          </li>
          <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">쉼터게시판</a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
              <li><a href="#" class="dropdown-item">자유게시판</a></li>
              <li><a href="#" class="dropdown-item">합격후기게시판</a></li>
            </ul>
          </li> 
          <li class="nav-item">
            <a href="index3.html" class="nav-link">파일공유게시판</a>
          </li>                                                 
        </ul>

      </div>

      <!-- Right navbar links -->
      <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
          
            <i class="fas fa-comments"></i>
            
            <span class="badge badge-danger navbar-badge">3</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Brad Diesel
                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">Call me whenever you can...</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    John Pierce
                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">I got your message bro</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Nora Silvester
                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">The subject goes here</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
          </div>
        </li>
        
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
          
            <i class="far fa-bell"></i>	
            
            <span class="badge badge-warning navbar-badge">15</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-header">15 Notifications</span>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> 4 new messages
              <span class="float-right text-muted text-sm">3 mins</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> 8 friend requests
              <span class="float-right text-muted text-sm">12 hours</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> 3 new reports
              <span class="float-right text-muted text-sm">2 days</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
            <i class="fas fa-th-large"></i>
          </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /.navbar -->
  </div>
  <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/resources/javascript/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/javascript/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/javascript/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/javascript/demo.js"></script>
</body>
</html>


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
	                  <li><a href="#">파일공유게시판</a></li>    
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
						<li class="dropdown-toggle" id="noticeCount">
						<a href="#" data-toggle="dropdown" role="button" aria-expanded="false"> 
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
   		
   	
	   	var email = "${user.email}";
	   	
	   	
	   	function noticeCount() {
	   		
	   		
	   		
	   			$.ajax(
	   					{
 					url : "/integration/json/getNoticeCount/"+email ,
 					method : "GET" ,
 					dataType : "json" ,
 					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"	 						
 					} ,
	   				success : function(JSONData, status){
	   					/* alert(JSONData); */
	   						if (JSONData != 0){
								let display = "<span id='test' style='background: red;'>"+JSONData+"</span>";
								$('#noticeCount > a > span').append(display); 
	   						}
	   				}
	   			});	   		
	   	};
	   	
	   	$('#noticeCount').on('click', function(){
	   		$.ajax(
	   				{
	   			url : "/integration/json/updateNotice/"+email ,
	   			method : "GET" ,
	   			dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					
				}
	   		})
	   		$('#test').remove();
	   	})
	   	
	   	
	   	function deleteNotice(noticeNo)	{
	   		
	   		$.ajax(
	   				{
	   				  url : "/integration/json/deleteNotice/"+noticeNo ,
	   				  method : "GET" ,
	   				  dataType : "json" ,
	 				  headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"	 						
	 				  } ,
	 				  
	 				  success : function(JSONData, status){
	 					
	 				  }
	 			
	   		});
	   	 $('.notice'+noticeNo).remove();
	   	}
	   	
	   	
	   	function deleteNoticeAll(){
	   		
	   		$.ajax(
	   				{
	   				  url : "/integration/json/deleteNoticeAll/"+email ,
	   				  method : "GET" ,
	   				  dataType : "json" ,
	 				  headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"	 						
	 				  } ,
	 				  
	 				  success : function(JSONData, status){
	 					 
	 				  }	
	   			});
	   		$('.notice').remove();
	   	}
   		
	 	
	 		
	 	
	 	
	 if( email != ''){
	 		
	 		
	 		$.ajax(
	 				{
	 					url : "/integration/json/getlistNotice/"+email ,
	 					method : "GET" ,
	 					dataType : "json" ,
	 					headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"	 						
	 					} ,
	 					
	 					
	 					success : function(JSONData, status){
	 						
	 						var display = '';
	 						if(JSONData.length > 0){
	 							for(var i = 0; i < JSONData.length; i++){
	 		 						
	 		 						if(JSONData[i].noticeCategory == '1'){
	 			 						display = "<div style='height: 40px' class='notice'>"
	 			 								+ "<span>"+JSONData[i].noticeBoard.boardTitle+"에 댓글이 달렸습니다.</span>"
	 			 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
	 			 					}
	 		 						else if (JSONData[i].noticeCategory == '2'){
		 		 						display = "<div style='height: 40px' class='notice'>"
		 		 								+ JSONData[i].noticeBoard.boardTitle+"에 답변이 달렸습니다."
		 		 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '3'){
		 		 						display = "<div style='height: 40px' class='notice'>"
		 		 								+ JSONData[i].noticeBoard.boardTitle+"의 답변이 채택되었습니다."
		 		 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '4'){
		 		 						display = "<div style='height: 40px' class='notice'>"
		 		 								+ JSONData[i].noticeStudy.studyName+"에 참가신청이 도착했습니다."
		 		 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '5' && JSONData[i].noticeGroupMember.approvalFlag == '1'){
		 		 						display = "<div style='height: 40px' class='notice'>"
	 		 								+ JSONData[i].noticeStudy.studyName+"에 참가신청이 승인 되었습니다."
	 		 								+ "</div>"
 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '5' && JSONData[i].noticeGroupMember.approvalFlag == '2'){
		 		 						display = "<div style='height: 40px' class='notice'>"
	 		 								+ JSONData[i].noticeStudy.studyName+"에 참가신청이 거절 되었습니다."
	 		 								+ "</div>"
 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '6'){
		 		 						display = "<div style='height: 40px' class='notice'>"
		 		 								+ "개인별 목표시간이 완료되었습니다."
		 		 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
		 		 					}
	 		 						else if (JSONData[i].noticeCategory == '7'){
		 		 						display = "<div style='height: 40px' class='notice'>"
		 		 								+ JSONData[i].sender.email+"에게 쪽지가 도착하였습니다."
		 		 								+ "</div>"
	 			 								+"<span><a href='javascript:deleteNotice("+JSONData[i].noticeNo+")'>X</a></span>";
	 		 						}
	 		 						 /* alert(display); */
	 		 						$('#noticeList').append(display); 
	 							}
	 							
	 						} else {
	 							display = "<li style='height: 40px'>도착한 알림이 없습니다..</li>";
	 							$('#noticeList').append(display);
	 						}
	 						noticeCount();	
	 					}
	 		})
	 		
		 
	 	
	 };
	 	
   	</script>
   	
   	<script type="text/javascript">

		//=============  오공 Event  처리 =============
		$( "a:contains('OGong')").on("click", function(){
			location.href = "/integration/mainPage";
		}) ;   	
   	   	
		//=============  자율스터디목록 Event  처리 =============
	 	$( "a:contains('자율스터디목록')" ).on("click" , function() {
	 		location.href = "/selfStudy/listStudy?studyType=self";
		});
		
	 	//=============  모집게시판 Event  처리 =============
	 	$( "a:contains('모집게시판')").on("click", function(){
	 		//location.href = "/board/listBoard?boardCategory="+'5';
	 		location.href = "/board/listBoard?boardCategory=5";
	 	});
	 	//=============  그룹스터디 Event  처리 =============
	 	$( "a:contains('그룹스터디')").on("click", function(){
	 		location.href = "/study/listStudy";
	 	});		 	
	 	
	 	//=============  정보공유게시판 Event  처리 =============
	 	$( "a:contains('정보공유게시판')").on("click", function(){
	 		location.href = "/board/listBoard?boardCategory="+'1';
	 	});	
	 	
	 	//=============  Q&A게시판 Event  처리 =============
	 	$( "a:contains('Q&A게시판')").on("click", function(){
	 		location.href = "/board/listBoard?boardCategory="+'2';
	 	});	 	 	
		
	 	//=============  자유게시판 Event  처리 =============
	 	$( "a:contains('자유게시판')").on("click", function(){
	 		location.href = "/board/listBoard?boardCategory="+'4';
	 	});	
	 	
	 	//=============  합격후기게시판 Event  처리 =============
	 	$( "a:contains('합격후기게시판')").on("click", function(){
	 		location.href = "/board/listBoard?boardCategory="+'3';
	 	});	 
	 	
	 	//=============  파일공유 게시판 Event  처리 =============
	 	$( "a:contains('파일공유게시판')").on("click", function(){
	 		location.href = "/board/listBoard?boardCategory="+'6';
	 		
	 	});	 
	 	//=============  신고조회 Event  처리 =============
	 	$( "a:contains('신고조회')").on("click", function(){
	 		location.href = "/admin/listUserReport";
	 	});	 	
	 	
	 	//=============  회원조회 Event  처리 =============
	 	$( "a:contains('회원조회')").on("click", function(){
	 		location.href = "/admin/listTotalUser?listType="+'1';
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
	 		location.href = "/integration/listSendMessage";
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
	 		location.href = "/banana/listBanana";
	 	});
	 	
	 	//=============  회원탈퇴 Event  처리 =============
	 	$( "a:contains('회원탈퇴')").on("click", function(){
	 		location.href = "/";
	 	});	 	 	
	
	</script> 
