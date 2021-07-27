<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
   	
   	<head>
		<script src="https://kit.fontawesome.com/e3409dba93.js" crossorigin="anonymous"></script>
	<style>
 
		
 		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');
		
		body, 
		table, 
		div, 
		p, 
		th, 
		td{
		font-family: 'Do Hyeon', sans-serif;
		}
		
				
   	</style> 		
		
   	</head>
   	
   	<body>
   						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
프로필 보기
</button>
<!-- 모달 영역 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
</div>
<div class="modal-body">
<div class="container">
	
		<div class="page-header">
	      <h1>${user.nickname}의 프로필</h1>
	    </div>
	
			  <input type="hidden" name="email"	value="${user.email}"/>  <!--  히든값 -->
	
		
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
		<hr>
				<div class="row">
				
				
	  		<div class="col-xs-4 col-md-2"><strong>관심사</strong></div>

			  <button type="button" class="btn btn-default btn-lg">${user.studyInterest1}</button>
					  <button type="button" class="btn btn-default btn-lg">${user.studyInterest2}</button>
					  <button type="button" class="btn btn-default btn-lg">${user.studyInterest3}</button>
			
		</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-primary"  >확인</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>




				
				
				
				
			</span>
		</div>
		
</div>
</div>





</div>
</div>


</div>
   	</body>