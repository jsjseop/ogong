<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!-- jQuery -->
<script src="/resources/javascript/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/javascript/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/javascript/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/javascript/demo.js"></script>

<script type="text/javascript">



	$(function(){
		$ ( "#btn1").on("click", function(){
			fncwithdrawreason();
		});
	});
	
	function fncwithdrawreason() {
		$("form").attr("method","POST").attr("action","/user/withdrawreason").submit();
	}
	
	
	var pw = $('.pw_input').val();				// 비밀번호 입력란

	
	/* 비밀번호 유효성 검사 */
	if(pw == ""){
		$('.final_pw_ck').css('display','block');
		pwCheck = false;
	}else{
		$('.final_pw_ck').css('display', 'none');
		pwCheck = true;
	}
	
	/* 비밀번호 확인 유효성 검사 */
	if(pwck == ""){
		$('.final_pwck_ck').css('display','block');
		pwckCheck = false;
	}else{
		$('.final_pwck_ck').css('display', 'none');
		pwckCheck = true;
	}
	
	
	
	
	
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');
		
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
		
		
	});
	
	

	
	
	
</script>

	<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}      
     </style>
<style >
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;

}
</style>
	<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}      
     </style>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   	<!-- ToolBar End /////////////////////////////////////-->

</head>
<body>
	<div class="container">
	<br><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">


		
				<h1 class="text-center">회원 탈퇴</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		  <input type="hidden" name="email"	value="${user.email}"/>  <!--  히든값 -->

		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">탈퇴 사유</label>
		    <div class="col-sm-4">
	 			<select class="form-control" name="withdrawreason"> 
						<option value="이용가능한 서비스 부족">이용가능한 서비스 부족</option>
						<option value="불편한 인터페이스">불편한 인터페이스</option>
						<option value="적은 사용자">적은 사용자</option>
						<option value="접근성 부족">접근성 부족</option>
						<option value="기타">기타</option>


				</select> 		    </div>
				
				
							  		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-2 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >회원탈퇴</button>
			  <a class="btn btn-info btn" href="/" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  

		  </div>

				
				
	
		    
		    
		    
		    
		  </div>
		</form>
				
				
				
				
			</span>
		</div>
		
		  

		

	
</body>
</html>




		  
		  
		  
		  
		  

		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>