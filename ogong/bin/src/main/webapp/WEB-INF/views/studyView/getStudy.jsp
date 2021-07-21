<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script type="text/javascript">
	$( function(){
		
		$("#btn").on("click", function(){
			self.location = "/study/listStudy"
		});
		
		$('#modal').modal("hide"); //닫기 
		 
		$('#modal').modal("show"); //열기
		
		$("#submit").on("click", function(){
			fncAddParticipation()
			alert("참가 신청 되었습니다.")
			alert("나중에 중복 신청을 방지하기위해 ajax를 사용 할 예정.")
		});
		
		
		function fncAddParticipation() {
			$("form").attr("method","POST").attr("action","/study/addParticipation").submit();
		}
	});
</script>
</head>
<body>

	<div class="container">
	
		<div class="page-header">
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
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  				<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					  참 가 신 청
					</button>
					<button id="btn" class="btn btn-primary" >확 인</button>
	  		</div>
		</div>
		
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