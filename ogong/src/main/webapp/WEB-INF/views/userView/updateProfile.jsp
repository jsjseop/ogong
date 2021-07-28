
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<<<<<<< HEAD
<!-- jQuery -->
<script src="/resources/javascript/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/resources/javascript/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/javascript/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/javascript/demo.js"></script>
=======
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="./jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
>>>>>>> refs/remotes/origin/테스트

<script type="text/javascript">


/////////////////////////////////////////////////////////// 관심사 
	$(function(){
		$ ( "#btn1").on("click", function(){
			fncupdateProfile();
			
			
		});
	});
	
	function fncupdateProfile() {
		$("form").attr("method","POST").attr("action","/user/updateProfile").submit();
		
		
	}
	

</script>
<<<<<<< HEAD

<style >
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
=======
	<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;
}      
     </style>
>>>>>>> refs/remotes/origin/테스트

}
</style>

	<!-- ToolBar Start /////////////////////////////////////-->
	
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />
	
   	<!-- ToolBar End /////////////////////////////////////-->

</head>
<body>
	<div class="container">
	<br><br/>
		<h1 class="text-center">내 프로필 수정</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">

		  <input type="hidden" name="email"	value="${user.email}"/>  <!--  히든값 -->

		
		
		  <div class="form-group">
		   <label for="studyName" class="col-sm-offset-1 col-sm-3 control-label">닉 네 임</label>  
		    <div class="col-sm-4" >
		      <input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}" placeholder="닉네임">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="studyRoomGrade" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="이름">
		    </div>
		  </div>
		 
 		 <div class="radio">
<%--   <label>
    <input type="radio" name="gender" id="gender" value="${user.gender}" checked>
    남성
  </label>
</div>
<div class="radio">
  <label>
    <input type="radio" name="gender" id="gender" value="${user.gender}">
    여성
  </label> 
</div>
<div class="radio disabled"> --%>

</div>
		 
		 
		  

		  

		  		  <div class="form-group">
		    <label for="groupStudyInfo" class="col-sm-offset-1 col-sm-3 control-label">목표와 각오</label>
		    <div class="col-sm-4">
		    <textarea style="height:100px; resize:none;" class="form-control" id="goal" name="goal"  placeholder="목표와 각오">${user.goal}</textarea>
		    </div>
		  </div> 
	 	  
		<div class="form-group">
<<<<<<< HEAD
			<label for="interest" class="col-sm-offset-1 col-sm-2 control-label">관심사</label>
=======
			<label for="interest" class="col-sm-offset-1 col-sm-1 control-label">관심사</label>
>>>>>>> refs/remotes/origin/테스트
			<span class="col-sm-1">
				
<<<<<<< HEAD
	 			<select class="form-control" name="studyInterest1"> 
						<option>${user.studyInterest1}</option>
=======
				
	 			<select class="form-control" name="studyInterest1">
						<option>관심사1</option>
>>>>>>> refs/remotes/origin/테스트
						<option value="어학">어학</option>
						<option value="공무원">공무원</option>
						<option value="자격증">자격증</option>
						<option value="취업">취업</option>
						<option value="자기계발">자기계발</option>
						<option value="독서">독서</option>
						<option value="임용">임용</option>
						<option value="기타">기타</option>
						<option value=""></option>

				</select> 
				
				<select class="form-control" name="studyInterest2">
<<<<<<< HEAD
						<option>${user.studyInterest2}</option>
=======
						<option>관심사2</option>
>>>>>>> refs/remotes/origin/테스트
						<option value="어학">어학</option>
						<option value="공무원">공무원</option>
						<option value="자격증">자격증</option>
						<option value="취업">취업</option>
						<option value="자기계발">자기계발</option>
						<option value="독서">독서</option>
						<option value="임용">임용</option>
						<option value="기타">기타</option>
						<option value=""></option>
						
				</select> 
				
<<<<<<< HEAD
				<select class="form-control" name="studyInterest3"> 
						<option>${user.studyInterest3}</option>
=======
				<select  class="form-control" name="studyInterest3"> 
						<option>관심사3</option>
>>>>>>> refs/remotes/origin/테스트
						<option value="어학">어학</option>
						<option value="공무원">공무원</option>
						<option value="자격증">자격증</option>
						<option value="취업">취업</option>
						<option value="자기계발">자기계발</option>
						<option value="독서">독서</option>
						<option value="임용">임용</option>
						<option value="기타">기타</option>
						<option value=""></option>
						
				</select>   
				
				
				
				
				
				  		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="btn1" class="btn btn-info"  >프로필 수정</button>
			  <a class="btn btn-info btn" href="/" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
				
				
				
				
			</span>
		</div>
		
		  

		

	
</body>
</html>



		  
	<!--    
		               <div class="col-sm-10 container-box">
                <div class="inner-container-box">
                    <h3>관심 분야 설정</h3>
                    <hr>
                    관심사는 총 3개까지 설정하실 수 있습니다.<br>
        <form>            
            <input id="selectbox1" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox2" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox3" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox4" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox5" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox6" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox7" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox8" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox9" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <input id="selectbox10" type="checkbox" name="chk" onClick="count_ck(this);"/>
            <section class="buttons">
                <label for="selectbox1">어학</label>
                <label for="selectbox2">공무원</label>
                <label for="selectbox3">자격증</label>
                <label for="selectbox4">취업</label>
                <label for="selectbox5">자기계발</label>
                <label for="selectbox6">독서</label>
                <label for="selectbox7">임용</label>
                <label for="selectbox8">기타</label>
            </section>
            <hr style="margin-top : 2em">
    </form>
                    <br>
                    <button class="btn btn-primary" id="saveBtn">저장</button>
                </div>

            </div>
        </div>
    </div>
 </div>  -->
		  
		  
		  
		  
		  
		  

		<!-- form Start /////////////////////////////////////-->
		
 	</div>
</body>
</html>
