<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');

body, table, div, p, th, td{
font-family: 'Do Hyeon', sans-serif;

}
img {
	width: 500px;
	height: 500px;
}
#studyThumbnail {
	float:center;
}
</style>

<script type="text/javascript">
	$( function(){
		
		$("#btn").on("click", function(){
			self.location = "/study/listStudy"
		});
		
		$("#apply").on("click", function(){
			
			var studyNo =${study.studyNo};	
			
			$.ajax({
				
				url: "/studyroom/json/checkDuplication",
				method: "POST",
				data: JSON.stringify({studyNo: studyNo}),
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success: function(data, status){
					
					if(data == false){
						
						$('#myModal').modal("show"); //열기
						
					
					}else if(data == true){
						alert("이미 참가신청 하셧습니다.");
					}
				},
				error:function(request, status, error){
					
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
				
			});
			
			
			
		});
		
		$("#submit").on("click", function(){
			
			alert("참가 신청 되었습니다.");
			fncAddParticipation();
			
		});
		
		
		function fncAddParticipation() {
			$("form").attr("method","POST").attr("action","/study/addParticipation").submit();
		}
	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />

	<div class="container">
	
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-warning">
						<div class="card-header">
							<h3 class="card-title">그룹스터디 정보 조회</h3>
						</div>
						<div class="card-body container">
						
							<label for="studyName">스터디명</label> 
							<div class="col-xs-8 col-md-4">${study.studyName}</div><hr/>
							
							<label for="studyInterest">관심주제</label> 	
							<div class="col-xs-8 col-md-4">${study.studyInterest}</div><hr/>
							
							<label for="groupStudyInfo">스터디 소개</label>
							<div class="col-xs-8 col-md-12">${study.groupStudyInfo}</div><hr/>
							
							<label for="groupStudyPlan">스터디 계획</label>
							<div class="col-xs-8 col-md-12">${study.groupStudyPlan}</div><hr/>
							
							<label for="groupStudyCondition">스터디 참가조건</label>
							<div class="col-xs-8 col-md-12">${study.groupStudyCondition}</div><hr/>
							
							<div class="hashTag_area">
								<label for="studyHashtag">해시태그</label>
								<div class="col-xs-8 col-md-12">${study.studyHashtag}</div>
							</div><hr/>
							
							<label for="studyThumbnail">스터디 썸네일</label>
							<div class="input-group mb-3">
								<div class="studyThumbnail">
									<img class="img-fluid img-thumbnail rounded" src="/resources/upload_files/study/${study.studyThumbnail}">
								</div>
							</div><hr/>

							<label>모집 기간 </label>
							<div class="col-xs-8 col-md-12">${study.recruitmentStartDate} ~ ${study.recruitmentEndDate}</div><hr/>
							
							<label>시작 기간 </label>
							<div class="col-xs-8 col-md-12">${study.studyStartDate} ~ ${study.studyEndDate}</div><hr/>
							
							<label>인 원</label>
							<div class="col-xs-8 col-md-12">${study.currentMember}명 / ${study.maxMember}명</div><hr/>





						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center ">
	  				<button id="apply" class="btn btn-info">
	  				<!-- data-toggle="modal" data-target="#myModal" -->
					  참 가 신 청
					</button>
					<button id="btn" class="btn btn-info" >확 인</button>
	  			</div>
			</div>
		</section>









		<%-- <div id="studyThumbnail">
			<img class="img-fluid img-thumbnail rounded" src="/resources/upload_files/study/${study.studyThumbnail}">
		</div>	 --%>
		<%-- <div class="page-header">
	       <h3 class=" text-info">스터디 상세조회</h3>
	    </div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>스 터 디 명</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>스터디 소개</strong></div>
			<div class="col-xs-8 col-md-4">${study.groupStudyInfo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>해 시 태 그</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyHashtag}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>인원</strong></div>
			<div class="col-xs-8 col-md-4">${study.currentMember} / ${study.maxMember}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>모집 기간</strong></div>
			<div class="col-xs-8 col-md-4">${study.recruitmentStartDate} ~ ${study.recruitmentEndDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>진행 기간</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyStartDate} ~ ${study.studyEndDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>썸 네 일</strong></div>
			<div class="col-xs-8 col-md-4">${study.studyThumbnail}</div>
		</div>
		
		<hr/> --%>
		
	<!-- 	<div class="row">
	  		<div class="col-md-12 text-center ">
	  				<button id="apply" class="btn btn-info">
	  				data-toggle="modal" data-target="#myModal"
					  참 가 신 청
					</button>
					<button id="btn" class="btn btn-info" >확 인</button>
	  		</div>
		</div> -->
		
		
		
		<br/>
		
		
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">그룹스터디 참가신청</h4>
		      </div>
		      <div class="modal-body">
		        <form>
		        	<input type="hidden" name="studyNo" value="${study.studyNo}">     
		        	<div class = "form-group">
		        		<label>참가신청 동기</label>
		        		<textarea name = "participationReason" class="form-control" maxLength="2048" style="height:180px"></textarea>
		        	</div>
		        	
		        	<div class = "form-group">
		        		<label>각 오</label>
		        		<textarea name = "determination" class="form-control" maxLength="2048" style="height:180px"></textarea>
		        	</div>
		        </form>
		      </div>
		      <div class="modal-footer">
		      	<button id="submit" class="btn btn-default" >신 청</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫 기</button>
		      </div>
		    </div>
		  </div>
		 </div>
		
 	</div>

</body>
</html>